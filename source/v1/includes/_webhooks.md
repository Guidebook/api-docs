# Webhooks

> Whenever a metrics event fires.  A POST request is made to your URL with data similar to the example below

```json
{
	"weid": "12345-e11fb47d-bb63-46f8-912c-9ba18c351970",
	"extra_metadata": null,
	"properties": {
		"first_name": "Example User",
		"last_name": "Last Name",
		"user_id": "11913",
		"guide_id": "61737",
		"company": "Guidebook",
		"session_id": "13745343",
		"email": "example_user@example.com",
		"guide_name": "Test Guide 1",
		"time": "2018-01-18T21:25:55.988868+0000",
		"position": "API Tester",
		"session_name": "Keynote Session: How to use the Open API",
	},
	"event": "MobileApp-UserRegisteredScheduleSession"
}
```

Guidebook offers a [Webhook API](https://en.wikipedia.org/wiki/Webhook) to allow customers to monitor and process metrics events in their guide.  Customers can get started by setting up their own Webhook URLs that will consume events.  Once their Webhook URL is live, they can go into [Guidebook Builder](https://builder.guidebook.com) and supply the Webhook URL and configure the metrics events they want that URL to be notified of.

Whenever a metrics event that you are monitoring occurs, we will immediately make a POST request to your Webhook with details of the metrics event.


## Event Dictionaries

There are a variety of possible events that can fire.  Each one will contain the following:

Key             | Type    | Description
---------       | --------  | -----------
weid            | string    | Unique id for this event.  You can use the Open API to refetch this event data via `weid` if needed.
event           | string    | The name of the event that happened.
properties    | dictionary   | All the extra details of the event that fired.  They keys will vary depending on type of event
extra_metadata    | dictionary | Usually null.  This is a field for integrations that require extra configuration options.


The properties dictionary will vary depending on the type of event that fired.  Here is an outline of the possible keys for each event.

Common properities available in most events

Key             | Description
---------       |  -----------
time       | UTC Timestamp of when this event happened.
guide_id   |  The guide id this metrics event happened on.
guide_name   | The guide name.
user_id      | The id of the user who performed the action.
first_name      | The first name of the user who performed the action.
last_name       | The last name of the user who performed the action,
company      | The company that the user filled out on their profile. Can be null.
position      | The company that the user filled out on their profile. Can be null.
email      | The email of the user.


<aside class="notice">
Note that there is a 5 second delay between Account creation and our metrics indexes updating with Account profile information.  This means that if a user signs up for a brand new account and then immediately starts triggering metrics events, the first few events might have Null first name, last name, and email fields.  This is an extremely rare edge case.  You are still always guaranteed the user_id field to be a non-null value.
</aside>

`MobileApp-UserRegisteredScheduleSession`

Key             | Description
---------       |  -----------
session_id      | The id of the session the user registered for.
session_name    | The name of the session the user registered for.


`MobileApp-UserMadeToDoItem`

Key             | Description
---------       |  -----------
custom_list_item_id      | The id of the custom list item the user added to their todo.
custom_list_item_name    | The name of the custom list item the user added to their todo.


`MobileApp-UserPostedPhoto`

Key             | Description
---------       |  -----------
photo_id      | The id of the photo the user uploaded.


`MobileApp-UserTaggedOtherUser`

Key             | Description
---------       |  -----------
tagged_user_id      | The id of the user tagged.
tagged_user_first_name |  The first name of the user tagged.
tagged_user_last_name  |  The last name of the user tagged.
tagged_user_company    |  The company that the tagged user filled out on their profile. Can be null.
tagged_user_position   |  The position that the tagged user filled out on their profile. Can be null.
tagged_user_email      |  The email for the tagged user.


`MobileApp-UserConnectionAccepted`

Key             | Description
---------       |  -----------
requesting_user_id     | The id of the user who requested the connection.
requesting_user_first_name |  The first name of the requesting user.
requesting_user_last_name  |  The last name of the requesting user.
requesting_user_company    |  The company that the requesting user filled out on their profile. Can be null.
requesting_user_position   |  The position that the requesting user filled out on their profile. Can be null.
requesting_user_email      |  The email for the requesting user.


`MobileApp-UserCheckedIn`

Standard fields. No additional fields.

`Builder-GuidePublished`

Standard fields, No additional fields.


## Security

When implementing your Webhook URL, please make sure to confirm that the POST data being sent to your Webhook is coming from Guidebook!!  Each Webhook you set up on Guidebook will have an unique security token.  This token will be visible on your Webhooks setup screen.

This token will be included in ALL webhook POST requests from guidebook in the header.  The header will be `GB_WEBHOOK_SECURITY_TOKEN`.  Please verify that the token matches before processing the event data.


## Webhook Examples

Guidebook's Salesforce integration was built on top of our Webhook API.  For some example code on how you can customize your own Salesforce integration with our Webhook API, you can visit our [github repo](https://github.com/Guidebook/guidebook-sfdc-integration).
