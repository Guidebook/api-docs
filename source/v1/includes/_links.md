# Links

The `Link` resource is an object that is displayed at the bottom section of either a `Session` object or `CustomListItem` in the Guidebook mobile app.  These objects represent special in-app links that will navigate the app user to the corresponding object in the mobile app.  A common use case of this feature would be a speaker linking to all the panels that the speaker is participating in.

`Link` objects will always contain a source and a target. In the example with speakers, the source would be the speaker `CustomListItem` and the target object would be a `Session` we want to link to.

## Creating a `Link`


```python
import requests

link_url =  'https://builder.guidebook.com/open-api/v1/links/'
api_key = 'API_KEY'
post_data =
{
	"_description": "testing overridden description",
	"target_object_id": 1,
	"source_object_id": 31,
	"source_content_type": "schedule.session",
	"guide": 7,
	"target_content_type": "custom_list.customlistitem"
}
response = request.post(link_url, data=post_data, headers={'Authorization': 'JWT ' + api_key}).json()


```

> The above commands return JSON structured like this:

```json
{
	"id": 33,
	"guide": 7,
	"source_content_type": "schedule.session",
	"target_content_type": "custom_list.customlistitem",
	"source_object_id": 31,
	"target_object_id": 1,
	"created_at": "2018-06-27T15:30:11.015128+0000",
	"rank": 0,
	"title": "Test List Item 1",
	"description": {
		"en-US": "testing overridden description"
	},
	"category_detail": {
		"id": 33,
		"name": "Items",
		"_name": "Items",
		"created_at": "2018-06-27T15:30:11.007205+0000",
		"rank": 2,
		"guide": 7
	},
	"category": 33,
	"_title": null,
	"_description": "testing overridden description"
}

```


This endpoint will create a `Link` for your `Guide`.

### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/links/`

### Model Fields

Parameter            | Required  | Type    | Description
---------            | --------  | ------- | -----------
guide                | yes | integer  | The specific `Guide` your `Link` belongs to.  See section on [Guides](#guides) for more info.
source_content_type  | yes | string   | The content type of the source object.  The options are: "schedule.session", "custom_list.customlistitem"
source_object_id     | yes | integer  | The id number of the source object.  Not updatable after creation.
target_content_type  | yes | string   | The content type of the target object.  The options are: "schedule.session", "custom_list.customlistitem"
target_object_id     | yes | integer  | The id number of the target object.  Not updatable after creation.
rank                 | no  | integer  | The order the `Link` will appear in the `Links` section on the app.  `Links` are displayed in ascending rank value.  If no rank value is supplied on creation, a default rank is used.
_title               | no  | string   | Use this field to override the default title of the `Link`.  The default behavior is to derive the title from the target object
_description         | no  | string   | Use this field to override the default description of the `Link`.  The default behavior is to derive the description from the target object
category             | no  | integer  | `LinkCategory` ID this `Link` will be displayed in.  Most of the logic regarding `LinkCategories` are automatically handled for you so you do not need to supply an category ID.   Use this field to update the category if needed.


## Listing `Links`


```python
import requests

link_url =  'https://builder.guidebook.com/open-api/v1/links/'
api_key = 'API_KEY'

# This will return all `Links` you have access to
response = request.get(link_url, headers={'Authorization': 'JWT ' + api_key})
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
			"source_content_type": "schedule.session",
			"target_content_type": "schedule.session",
			"source_object_id": 37,
			"target_object_id": 38,
			"created_at": "2018-06-27T15:19:05.300403+0000",
			"rank": 0,
			"title": "session B",
			"description": {
				"start_time": "2018-06-27 15:19:05.283843+00:00",
				"end_time": "2018-06-27 16:19:05.283850+00:00"
			},
			"category_detail": {
				"id": 39,
				"name": "Sessions",
				"_name": "Sessions",
				"created_at": "2018-06-27T15:19:05.294694+0000",
				"rank": 1,
				"guide": 12
			},
			"category": 39,
			"_title": null,
			"_description": null
		},
		{
			"id": 40,
			"guide": 12,
			"source_content_type": "schedule.session",
			"target_content_type": "schedule.session",
			"source_object_id": 38,
			"target_object_id": 37,
			"created_at": "2018-06-27T15:19:05.310453+0000",
			"rank": 0,
			"title": "session A",
			"description": {
				"start_time": "2018-06-27 15:19:05.281825+00:00",
				"end_time": "2018-06-27 16:19:05.281833+00:00"
			},
			"category_detail": {
				"id": 40,
				"name": "Sessions",
				"_name": "Sessions",
				"created_at": "2018-06-27T15:19:05.304460+0000",
				"rank": 1,
				"guide": 12
			},
			"category": 40,
			"_title": null,
			"_description": null
		},
		{
			"id": 41,
			"guide": 12,
			"source_content_type": "schedule.session",
			"target_content_type": "schedule.session",
			"source_object_id": 37,
			"target_object_id": 39,
			"created_at": "2018-06-27T15:19:05.319159+0000",
			"rank": 0,
			"title": "session C",
			"description": {
				"start_time": "2018-06-27 15:19:05.285326+00:00",
				"end_time": "2018-06-27 16:19:05.285333+00:00"
			},
			"category_detail": {
				"id": 39,
				"name": "Sessions",
				"_name": "Sessions",
				"created_at": "2018-06-27T15:19:05.294694+0000",
				"rank": 1,
				"guide": 12
			},
			"category": 39,
			"_title": null,
			"_description": null
		}
	]
}
```


This endpoint can also be used to read data on `Links`.

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/links/`

### Model Fields

Same as the fields used in creation with the addition of the following read-only fields

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | An unique identifier for your `Link`.
created_at      | datetime | Time when this `Link` was created - UTC.
title           | string   | Title that will be displayed in the app.  To change this, please use the _title field.
description     | string/dictionary    | Description that will be displayed in the app.  To change this, please use the _description field.
category_detail | dictionary | Extra metadata on the `LinkCategory` of this `Link`


### Filtering data by `Guide` id

Including a query parameter `guide` allows you to filter for all `Links` related to a `Guide` you have access to (`Guide` 47 in this example):

`GET https://builder.guidebook.com/open-api/v1/links/?guide=47`


## Retrieving a `Link`
In the following examples, we will assume that the id of the `Link` we'd like to modify is 71.
To retrieve an individual `Link` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/links/71/`

## Updating a `Link`

To modify an existing `Link` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1/links/71/`

You will only need to include the specific fields you are updating and not a full request body.

## Deleting a `Link`

To delete a particular `Link`, issue a `DELETE` request to the url that points to the specific `Link` you'd like deleted:

`DELETE https://builder.guidebook.com/open-api/v1/links/71/`
