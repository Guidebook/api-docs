# Quick Info

The `QuickInfo` resource is an object that is displayed at the top section of a `Guide`, a `Session` or a `CustomListItem`. These objects contain small pieces of information that may be useful to the `Guide`,`Session` or `CustomListItem` they are located on. For example, the WIFI password of a room where a `Session` is located could easily be displayed by one of these objects. 

`QuickInfo` objects will always contain a target. In the example with WIFI, the target object would be the `Session` the WIFI password applies to. The title could then be WIFI, and content would be the actual password. 

## Creating `QuickInfo`


```python
import requests

quick_info_url =  'https://builder.guidebook.com/open-api/v1/quick-info/'
api_key = 'API_KEY'
post_data =
{
	"target_object_id": 1,
	"guide": 7,
	"target_content_type": "custom_list.customlistitem",
	"title": "Test Title 1",
	"content": "Test Content 1"
}
response = request.post(quick_info_url, data=post_data, headers={'Authorization': 'JWT ' + api_key}).json()


```

> The above commands return JSON structured like this:

```json
{
	"id": 33,
	"guide": 7,
	"target_content_type": "custom_list.customlistitem",
	"target_object_id": 1,
	"created_at": "2018-06-27T15:30:11.015128+0000",
	"rank": 0,
	"title": "Test Title 1",
	"content": "Test Content 1"
}

```


This endpoint will create a `QuickInfo` for your `Guide`.

### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/quick-info/`

### Model Fields

Parameter            | Required  | Type    | Description
---------            | --------  | ------- | -----------
guide                | yes | integer  | The specific `Guide` your `QuickInfo` belongs to.  See section on [Guides](#guides) for more info.
target_content_type  | yes | string   | The content type of the target object.  The options are: "guide.guide", schedule.session", "custom_list.customlistitem"
target_object_id     | yes | integer  | The id number of the target object.  Not updatable after creation.
title     			 | no | string   | The title of the `QuickInfo`. If not provided, this defaults to "Title".
content 		     | no | string   | The content of the `QuickInfo`. If not provided, this defaults to "Content".
rank                 | no  | integer  | The order the `QuickInfo` will appear in the `QuickInfo` section on the app. If no rank value is supplied on creation, a default is used.


## Listing `QuickInfo`


```python
import requests

quick_info_url =  'https://builder.guidebook.com/open-api/v1/quick-info/'
api_key = 'API_KEY'

# This will return all `QuickInfo` you have access to
response = request.get(quick_info_url, headers={'Authorization': 'JWT ' + api_key})
```

> The above command returns JSON structured like this:

```json
{
	"count": 3,
	"next": null,
	"previous": null,
	"results": [
		{
			"id": 39,
			"guide": 12,
			"target_content_type": "schedule.session",
			"target_object_id": 38,
			"created_at": "2018-06-27T15:19:05.300403+0000",
			"rank": 0,
			"title": "Test Title 1",
			"content": "Test Content 1"
		},
		{
			"id": 40,
			"guide": 12,
			"target_content_type": "schedule.session",
			"target_object_id": 37,
			"created_at": "2018-06-27T15:19:05.310453+0000",
			"rank": 0,
			"title": "Test Title 2",
			"content": "Test Content 2"
		},
		{
			"id": 41,
			"guide": 12,
			"target_content_type": "schedule.session",
			"target_object_id": 39,
			"created_at": "2018-06-27T15:19:05.319159+0000",
			"rank": 0,
			"title": "Test Title 3",
			"content": "Test Content 3"
		}
	]
}
```


This endpoint can also be used to read data on `QuickInfo`.

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/quick-info/`

### Model Fields

Same as the fields used in creation with the addition of the following read-only fields

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | A unique identifier for your `QuickInfo`.
created_at      | datetime | Time when this `QuickInfo` was created - UTC.


### Filtering data by `Guide` id

Including a query parameter `guide` allows you to filter for all `QuickInfo` related to a `Guide` you have access to (`Guide` 47 in this example):

`GET https://builder.guidebook.com/open-api/v1/quick-info/?guide=47`


## Retrieving a `QuickInfo`
In the following examples, we will assume that the id of the `QuickInfo` we'd like to modify is 71.
To retrieve an individual `QuickInfo` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/quick-info/71/`

## Updating a `QuickInfo`

To modify an existing `QuickInfo` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1/quick-info/71/`

You will only need to include the specific fields you are updating and not a full request body.

## Deleting a `QuickInfo`

To delete a particular `QuickInfo`, issue a `DELETE` request to the url that points to the specific `QuickInfo` you'd like deleted:

`DELETE https://builder.guidebook.com/open-api/v1/quick-info/71/`
