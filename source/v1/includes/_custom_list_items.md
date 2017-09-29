# CustomListItems

## How to Create a CustomListItem


```python
import requests

custom_list_item_url =  'https://builder.guidebook.com/open-api/v1/custom-list-items/'
api_key = 'API_KEY'
post_data =
{
	"import_id": "exhibitor_42",
	"guide": 1,
	"description_html": "<p>This is a description field that supports basic HTML</p>",
	"name": "Test Custom List Item Created via the Open API"
}
response = request.post(custom_list_item_url, data=post_data, headers={'Authorization': 'JWT ' + api_key}).json()


```

> The above commands return JSON structured like this:

```json
{
	"id": 1,
	"import_id": "exhibitor_42",
	"name": "Test Custom List Item Created via the Open API",
	"description_html": "<p>This is a description field that supports basic HTML</p>",
	"subtitle": null,
	"allow_rating": false,
	"guide": 1,
	"custom_lists": [],
	"locations": [],
	"created_at": "2017-09-27T08:19:08.544919+0000"
}

```


This endpoint will create a `CustomListItem` for your `Guide`.

### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/custom-list-items/`

### Model Fields

Parameter       | Required  | Type    | Description
---------       | --------  | ------- | -----------
guide           | yes | integer  | The specific `Guide` your `CustomListItem` belongs to.  See section on [`Guide`](#guides)s for more info.
name            | yes | string   | The title of your `CustomListItem`.
description_html| yes | string   | A text description of the `CustomListItem`. This field supports basic HTML.
subtitle        | no  | string   | A short tagline thats displayed below the name of the name field.
allow_rating    | no  | boolean  | A boolean value indicating if end-users can rate this `CustomListItem`.
import_id       | no  | string     | A string field you can used to input your own identifier.  This is for when you have your own IDs for `CustomListItem`s in your data store.


## How to Fetch Data on `CustomListItem`s


```python
import requests

custom_list_item_url =  'https://builder.guidebook.com/open-api/v1/custom-list-items/'
api_key = 'API_KEY'

# This will return all `CustomListItem`s you have access to
response = request.get(custom_list_item_url, headers={'Authorization': 'JWT ' + api_key})
```

> The above command returns JSON structured like this:

```json
{
	"count": 4,
	"next": null,
	"previous": null,
	"results": [
		{
			"id": 1,
			"import_id": null,
			"name": "Test List Item 1",
			"description_html": null,
			"subtitle": null,
			"allow_rating": true,
			"guide": 5,
			"custom_lists": [
				6
			],
			"locations": [],
			"created_at": "2017-09-27T08:11:40.183229+0000"
		},
		{
			"id": 2,
			"import_id": null,
			"name": "Test List Item 2",
			"description_html": null,
			"subtitle": null,
			"allow_rating": true,
			"guide": 5,
			"custom_lists": [
				6
			],
			"locations": [],
			"created_at": "2017-09-27T08:11:40.189964+0000"
		},
		{
			"id": 3,
			"import_id": null,
			"name": "Test List Item 3",
			"description_html": null,
			"subtitle": null,
			"allow_rating": true,
			"guide": 5,
			"custom_lists": [
				6
			],
			"locations": [],
			"created_at": "2017-09-27T08:11:40.195613+0000"
		},
		{
			"id": 4,
			"import_id": null,
			"name": "Test List Item 4, Different Guide",
			"description_html": null,
			"subtitle": null,
			"allow_rating": true,
			"guide": 6,
			"custom_lists": [
				7
			],
			"locations": [],
			"created_at": "2017-09-27T08:11:40.200571+0000"
		}
	]
}
```


This endpoint can also be used to read data on `CustomListItems`.

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/custom-list-items/`

### Model Fields

Same as the fields used in creation with the addition of the following read-only fields

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | An unique identifier for your `CustomListItem`.
created_at      | datetime | Time when this `CustomListItem` was created - UTC.
custom_list     | list of integers | A list of the `CustomList` IDs that this `CustomListItem` is related to.


### Filtering By `Guide` Id

Including a query parameter `guide` allows you to filter for all `CustomListItem`s related to a `Guide` you have access to (`Guide` 47 in this example):

`GET https://builder.guidebook.com/open-api/v1/custom-list-items/?guide=47`