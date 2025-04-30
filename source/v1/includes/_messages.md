# Messages

## Creating a `Message`


```python
import requests

messages_list_url =  'https://builder.guidebook.com/open-api/v1/messages/'
api_key = 'API_KEY'
post_data =
{
	"guide": 1,
	"inbox": 42,
	"title": "Title of Message",
	"message": "Message created from the Open API"
}
response = requests.post(messages_list_url, data=post_data, headers={'Authorization': 'JWT ' + api_key})

```

> The above command returns JSON structured like this:

```json
{
  "id": 35,
  "guide": 415,
  "inbox": 204,
  "title": "Title of Message",
  "message": "Message created from the Open API",
  "scheduled_send_time": "2018-09-13T03:54:09.238987+0000",
  "attachment_object": null,
  "is_push_notification": false,
  "segmented_push_options": null
}


```


This endpoint will create a `Message` that is in an `Inbox` that is in your `Guide`.  You can schedule the timing of when this `Message` will go live to your attendees.

### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/messages/`

### Model Fields

Parameter       | Required  | Type    | Description
---------       | --------  | ------- | -----------
guide           | yes | integer  | The specific `Guide` your `Message` belongs to.  See section on [Guides](#guides) for more info.
inbox           | yes | integer  | The specific `Inbox` your `Message` belongs to.  See section on [Inboxes](#inboxes) for more info.
title           | yes  | string  | A short title for your `Message`.  This is the subject line that will be displayed.  Limited to 80 characters.
message         | no  | string   | Optional long message if you have more info to share.  Limited to 1024 characters.
scheduled_send_time | no | datetime | Optional timestamp in UTC of when you want this `Message` to be sent to attendees.  If left blank, it will default to the current time and the message is sent immediately.
is_push_notification | no | boolean | Optional boolean to indicate if you want to send the `Message` as a push notification. If left blank, it will default to false. Limits apply - See https://support.guidebook.com/hc/en-us/articles/205012050-Send-Notifications-to-Your-Users
attachment_content_type | no | string | String indicating the content type of the attachment object.  The options are: "schedule.session", "custom_list.customlistitem". `attachment_object_id` must be filled out if this field is provided.
attachment_object_id | no | integer | The id number of the attachment object.  Not updatable after creation. `attachment_content_type` must be filled out if this field is provided.
segmented_push_options | sometimes | JSON | Required information for if you want to send push notifications to specific users.

### Targeting Specific Users with `segmented_push_options`
To target specific users, issue a `POST` request where the `segmented_push_options` field is a dictionary like:

`{"segment_type": <segment_type>, "targets": [<target_id_1>, <target_id_2>, <target_id_n>]}`

`segment_type` can be "session", "email", or "attendees_and_groups". If targeting `attendees` or `groups`, you must specify which with a dictionary like:

`{"segment_type": "attendees_and_groups", "targets": {"groups": [<group_id_1>, <group_id_2>, <group_id_n>]}}`


## Listing `Messages`


```python
import requests

messages_url =  'https://builder.guidebook.com/open-api/v1/messages/'
api_key = 'API_KEY'

# This will return all messages you have access to
response = requests.get(messages_url, headers={'Authorization': 'JWT ' + api_key})
```

> The above command returns JSON structured like this:

```json
{
  "count": 3,
  "next": null,
  "previous": null,
  "results": [
    {
      "id": 38,
      "guide": 427,
      "inbox": 219,
      "title": "Message 1",
      "message": "Hello",
      "scheduled_send_time": "2018-09-13T04:31:41.137633+0000",
      "attachment_object": null,
      "is_push_notification": false,
      "segmented_push_options": null
    },
    {
      "id": 39,
      "guide": 427,
      "inbox": 219,
      "title": "Message 2",
      "message": "Hello Again",
      "scheduled_send_time": "2018-09-13T04:31:41.139402+0000",
      "attachment_object": null,
      "is_push_notification": false,
      "segmented_push_options": null
    },
    {
      "id": 40,
      "guide": 427,
      "inbox": 219,
      "title": "Message 3",
      "message": "Good Bye",
      "scheduled_send_time": "2018-09-13T04:31:41.141097+0000",
      "attachment_object": null,
      "is_push_notification": false,
      "segmented_push_options": null
    }
  ]
}

```


This endpoint can also be used to read data on `Messages`.  Typically, this endpoint is called with a `guide` filter such that it returns a list of `Messages` associated to a lone `Guide` object that is owned by you.

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/messages/`

### Model Fields

The fields returned in the `GET` responses include an additionally field:

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | An unique identifier for your `Message`.
attachment_object | string | A string indicating the content type and id of the object. Ex. schedule.session:321
segmented_push_options | string | A dictionary listing the targets your message will be sent to.


### Filtering data by `Guide` id and other fields

Including a query parameter `guide` allows you to filter for all `Messages` related to a `Guide` you have access to (`Guide` 47 in the following example):

`GET https://builder.guidebook.com/open-api/v1/messages/?guide=47`


## Retrieving an `Message`

To retrieve an individual `Message` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/messages/71/`

The above request will fetch data for the `Message` with the id 71.


## Updating `Message` info

You can update the title and message fields of your `Message` object.  However, you will lose edit functionality once the `scheduled_send_time` is passed.  Once your `Message` is sent out to `Attendees`, this action can not be undone.

To modify an existing `Message` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1/messages/71/`

You will only need to include the specific fields you are updating and not a full request body.


## Deleting an `Message`

To delete a particular `Message`, issue a `DELETE` request to the url that points to the specific `Message` you'd like deleted.  Be very careful about deleting `Messages` that have been sent.  The delete operation only removes the `Message` on the Guidebook side, users will retain the `Messages` they have downloaded on their devices.

`DELETE https://builder.guidebook.com/open-api/v1/messages/71/`
