# Attendees

## Creating an `Attendee`


```python
import requests

attendees_list_url =  'https://builder.guidebook.com/open-api/v1/attendees/'
api_key = 'API_KEY'
post_data =
{
	"guide": 1,
	"email": "open_api@example.com",
	"first_name": "Open API",
	"last_name": "Example User"
}
response = requests.post(attendees_list_url, data=post_data, headers={'Authorization': 'JWT ' + api_key})

```

> The above command returns JSON structured like this:

```json
{
	"id": 1,
	"guide_id": 1,
	"import_id": null,
	"account_id": 2,
	"first_name": "Open API",
	"last_name": "Example User",
	"email": "open_api@example.com",
	"avatar": null,
	"cover": null,
	"app_profile": {
		"website": "",
		"position": "",
		"company": "",
		"contact_email": ""
	},
	"revoked": false,
	"email_opt_out": false,
	"status": 0,
	"last_email_send": null,
	"qr_badge": "f=Open+API&l=Example+User&i=1&ii=&s=e9dfa0c529c4a6f4880f4d324a12723d5475b3d9"
}

```


This endpoint will create an `Attendee` that is owned by your `Account`.  An `Attendee` is an object that formally defines a relation between a `Guide` and a Guidebook App end-user.  When importing your `Attendees`, we will attempt to match to existing users in the Guidebook database.  If no user is found via email matching, we will create a placeholder `Account` that the end-user can later claim by logging in.

The `Attendee` create operation is a special endpoint that we've made idempotent to facilitate client use cases.  If an `Attendee` object already exists, we will return the `Attendee` object and the POST data supplied will be ignored and not treated as an update operation.

### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/attendees/`

### Model Fields

Parameter       | Required  | Type    | Description
---------       | --------  | ------- | -----------
guide           | yes | integer  | The specific `Guide` your `Attendee` belongs to.  See section on [Guides](#guides) for more info.
import_id       | no  | string     | A string field you can use to input your own identifier.  This is for when you have your own IDs for `Attendees` in your data store.
email           | yes | string    | Email address of the `Attendee`.  We will search existing Guidebook users and attempt to associate with an existing account.
first_name      | no  | string    | First name of the Attendee.  Only used if no existing Guidebook Account was found via email matching. Otherwise, this field is ignored.
last_name      | no  | string    | Last name of the Attendee.  Only used if no existing Guidebook Account was found via email matching. Otherwise, this field is ignored.



## Listing `Attendees`


```python
import requests

attendees_url =  'https://builder.guidebook.com/open-api/v1/attendees/'
api_key = 'API_KEY'

# This will return all attendees you have access to
response = requests.get(attendees_url, headers={'Authorization': 'JWT ' + api_key})
```

> The above command returns JSON structured like this:

```json
{
	"count": 4,
	"next": null,
	"previous": null,
	"results": [
		{
			"id": 2,
			"guide_id": 2,
			"account_id": 4,
			"import_id": null,
			"first_name": "",
			"last_name": "",
			"email": "a@example.com",
			"avatar": null,
			"cover": null,
			"app_profile": {
				"website": "",
				"position": "",
				"company": "",
				"contact_email": ""
			},
			"revoked": false,
			"email_opt_out": false,
			"status": 1,
			"last_email_send": null,
			"qr_badge": "f=&l=&i=2&ii=&s=e9dfa0c529c4a6f4880f4d324a12723d5475b3d9"
		},
		{
			"id": 3,
			"guide_id": 2,
			"account_id": 5,
			"import_id": null,
			"first_name": "",
			"last_name": "",
			"email": "b@example.com",
			"avatar": null,
			"cover": null,
			"app_profile": {
				"website": "",
				"position": "",
				"company": "",
				"contact_email": ""
			},
			"revoked": false,
			"email_opt_out": false,
			"status": 1,
			"last_email_send": null,
			"qr_badge": "f=&l=&i=3&ii=&s=bw7lsa87leh9wql8nuiwutykgi5d5gig1o0czl08"
		},
		{
			"id": 4,
			"guide_id": 2,
			"account_id": 6,
			"import_id": null,
			"first_name": "",
			"last_name": "",
			"email": "c@example.com",
			"avatar": null,
			"cover": null,
			"app_profile": {
				"website": "",
				"position": "",
				"company": "",
				"contact_email": ""
			},
			"revoked": false,
			"email_opt_out": false,
			"status": 1,
			"last_email_send": null,
			"qr_badge": "f=&l=&i=4&ii=&s=7vexvjq13lthpz1690u69ksawt3v65ff73b9hxao"
		},
		{
			"id": 5,
			"guide_id": 3,
			"account_id": 7,
			"import_id": null,
			"first_name": "",
			"last_name": "",
			"email": "d@example.com",
			"avatar": null,
			"cover": null,
			"app_profile": {
				"website": "",
				"position": "",
				"company": "",
				"contact_email": ""
			},
			"revoked": false,
			"email_opt_out": false,
			"status": 1,
			"last_email_send": null,
			"qr_badge": "f=&l=&i=5&ii=&s=bla4e60zq1d19pzg85x1j9jh9fskukmqpw2p4dl7"
		}
	]
}
```


This endpoint can also be used to read data on `Attendees`.  Typically, this endpoint is called with a `guide` filter such that it returns a list of `Attendees` associated to a lone `Guide` object that is owned by you.

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/attendees/`

### Model Fields

The fields returned in the `GET` responses are far more detailed and include the following fields:

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | An unique identifier for your `Attendee`.
created_at      | datetime | Time when this `Attendee` was created - UTC.
last_email_send | datetime | Time when an invite email was sent to this `Attendee` - UTC.  Note that this field can be null if no emails have been sent.
guide_id        | integer  | The specific `Guide` your `Attendee` belongs to.  See section on [Guides](#guides) for more info.
account_id      | integer  | The unique ID for the `Account` object that this attendee is linked to.
first_name      | string   | First name of the `Attendee`.
last_name       | string   | Last name of the `Attendee`.
email           | string   | Email address of the `Attendee`.
avatar          | image   | Avatar image for this `Attendee`. For newly invited `Attendees`, you can update this field.  If the `Attendee` has logged in and claimed their account, then this field is read-only. See section on [images](#images) to update.
cover           | image   | Cover (background) image for the `Attendee`. For newly invited `Attendees`, you can update this field.  If the `Attendee` has logged in and claimed their account, then this field is read-only. See section on [images](#images) to update.
app_profile     | dictionary of strings | Contains profile information filed out by the `Attendee`.  Possible keys include `company`, `position`, `contact_email`, `website`.  Note that these keys can change at anytime! For newly created `Attendees` over the API, you can submit data for `company` and `profile`.  If there is existing app_profile data for an `Attendee`, then this field is read-only.
revoked         | boolean  | Indicates if this `Attendee` still has access to this guide.  This field is only relevant if your `Guide` is using the `invite-only` security option.
email_opt_out   | boolean  | Indicates if this `Attendee` should receive emails for this `Guide`.
status          | integer  |  Integer status code.  0 - Attendee Created, 1 - New Account Created, Email Invite Sent, 2 - Existing Account matched, Email Invite Sent, 3 - Email Invite Accepted/Attendee Logged In.
qr_badge		| string   | String that is used to create an attendee's QR code.


## Sending Invite Emails to Attendees


```python
import requests

attendees_email_url =  'https://builder.guidebook.com/open-api/v1/guides/47/send-attendee-invite-email/'
api_key = 'API_KEY'

post_data =
{
	"attendees": [1,2,3,4,5]
}
response = requests.post(attendees_email_url, data=post_data, headers={'Authorization': 'JWT ' + api_key})

```

> The above command returns JSON structured like this:

```json
{
	"successful_emails": [1,2,3]
}
```


Once your attendees are created in Builder, you can send them an invite email to download your guide or mobile app.  A dedicated endpoint for this is located at.

`POST https://builder.guidebook.com/open-api/v1/guides/<GUIDE_ID>/send-attendee-invite-email/`

The example here will attempt to send invite emails to `Attendees` 1 through 5 on `Guide` 47.  If you supply `Attendee` Ids that do not match the `Guide`, you will receive an error response.  Additionally, this response is limited to a list of 500 Ids per request.  If emails are successfully sent to the the Attendees, they will appear in the success response under the successful_emails key.  Emails are rate limited to once per 24 hours.  This limit is enforce based on the `last_email_send` field for each `Attendee`.  In the code sample here, `Attendees` 4 & 5 had already been sent invite emails in the past 24 hours so they were not sent emails and therefore not in the successful_emails response list.

<aside class="notice">
You must publish your `Guide` via the Builder CMS before you can send out invite emails to download your `Guide`.  Additionally, if the `Attendee` has opted out of emails, they will not be sent any invite emails.
</aside>


### Filtering data by `Guide` id and other fields

Including a query parameter `guide` allows you to filter for all `Attendees` related to a `Guide` you have access to (`Guide` 47 in the following example):

`GET https://builder.guidebook.com/open-api/v1/attendees/?guide=47`

You are also able to filter by the fields `revoked`, `status`, `import_id`, and `account__email` if you want to fetch a list of `Attendees` fitting specific criteria.  See examples below for how to filter on to these fields and combining multiple filters:

`GET https://builder.guidebook.com/open-api/v1/attendees/?guide=47&status=3`

`GET https://builder.guidebook.com/open-api/v1/attendees/?guide=47&revoked=True`

`GET https://builder.guidebook.com/open-api/v1/attendees/?guide=47&account__email=test@example.com`

`GET https://builder.guidebook.com/open-api/v1/attendees/?guide=47&import_id=test_import_id`


### Sorting Returned Data

When fetching a list of your `Attendees`, you're also able to control the order of the returned data if this is important for your needs.  The fields that you can sort by are `email`, `first_name`, `last_name`, `revoked`, and `status`. The following example will sort all `Attendees` from `Guide` 47 by `email` in alphabetical order:

`GET https://builder.guidebook.com/open-api/v1/attendees/?guide=47&ordering=email`

Prepending `-` in front of an ordering field reverses it.  The following example with sort by last name in reverse alphabetical order and then do a secondary sort in alphabetical order by first name:

`GET https://builder.guidebook.com/open-api/v1/attendees/?guide=47&ordering=-last_name,first_name`


## Retrieving an `Attendee`

To retrieve an individual `Attendee` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/attendees/71/`

The above request will fetch data for the `Attendee` with the id 71.


## Updating `Attendee` info

The `Attendee` object defines the relationship between an individual and a given `Guide`.  Fields such as `status` can not be manipulated via the Open API. Additionally we do not allow you to manipulate the profile information of the individual accounts.  These are controlled by the end-user themselves.

There are three fields we allow you to update - `revoked`, `email_opt_out`, and `import_id`.  Updating the `revoked` field will toggle access to an invite-only guide.  If you have a public guide, this field will have no effect.  The `import_id `field acts as a link between the Attendee in Builder and the unique identifier of the related account in your system. In practice, this field should be populated during creation. However, if that is untenable, you can update that field at a later point in time via the Open API.

<aside class="notice">
Be very cautious with updating <code>import_ids</code>!  If your integration requires the use of the `import_id` of an Attendee, please fill this field on creation.  If this is not possible, please attempt to fill in the `import_id` ASAP.  The Guidebook Mobile Clients will cache Attendee `id` and `import_id` information when an individual signs in and first accesses a guide.  If you change the `import_id` via the Open API, you will still need to have the updated users logout and log back in to update their cached Ids.
</aside>


## Deleting an `Attendee`

The `Attendee` object is a crucial component that's used in our metrics tracking system.  In order to preserve the accuracy of metrics reports, we do NOT allow Attendee objects to be deleted once they been created.  If you want to "revoke" a person's access to a specific guide, you would issue a PATCH request and set revoked=True.

We do allow various Open API operations for objects that are related to an `Attendee` and a `Guide`. i.e [Personalized Schedules](#personalizedschedules) for a given `Attendee`.


## Retrieving an Attendee In a Web View
Starting in version 6.5.0 of the Guidebook mobile app (or in your branded app), you can now retrieve information about the current logged in user when they're viewing a `Web View` module.  The `id` and the `import_id` of the current logged in `Attendee` is surfaced via javascript.  After a guide `Web View` document has finished loading, the mobile app will call a javascript function named `onGuidebookLoad`, if it has been defined.  In that function, or anytime after that function has been called, you can access the `import-id` and `attendee-id` on the global object `Guidebook`.


### HTML Example
```html
<!DOCTYPE html>
<html>

<head>
<h3>Test for Attendee Webview</h3>
<h3 id="error"></h3>
</head>
<body>

<h4> Test for Attendee ID </h4>
<p id="attendee-id">No attendee id</p>
<p id="import-id">No import id</p>


<script>
function onGuidebookLoad(){
	if(Guidebook.attendee_id != null) {
		document.getElementById("attendee-id").innerHTML = "Attendee id: " + Guidebook.attendee_id;
	}
	if(Guidebook.import_id != null) {
		document.getElementById("import-id").innerHTML = "Import id: " + Guidebook.import_id;
	}
}

</script>

</body>
</html>
```

To test the example, add a `Web View` feature to your guide in Builder, then upload the example HTML snippet.  Login to the app on your mobile device, download the guide, then open the `Web View` you just created.

## Publishing a `PersonalizedSchedule` for an `Attendee`

To publish a `PersonalizedSchedule` for a specific `Attendee` object, issue a `POST` request like:

`POST https://builder.guidebook.com/open-api/v1/attendees/21/publish-personalized-schedules/`

A successful request to this endpoint will return a status code of `202 ACCEPTED`

To successfully publish a personalized schedule for an attendee, the attendee's guide must be on a Premium service level and must already be published.
