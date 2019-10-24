# CustomListItems

## Creating a `CustomListItem`


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
	"created_at": "2017-09-27T08:19:08.544919+0000",
	"image": null,
	"thumbnail": null
}


```


This endpoint will create a `CustomListItem` for your `Guide`.

### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/custom-list-items/`

### Model Fields

Parameter       | Required  | Type    | Description
---------       | --------  | ------- | -----------
guide           | yes | integer  | The specific `Guide` your `CustomListItem` belongs to.  See section on [Guides](#guides) for more info.
name            | yes | string   | The title of your `CustomListItem`.
description_html| yes | string   | A text description of the `CustomListItem`. This field has a 20,000 character limit.  This field supports basic HTML. See section on [html text](#html-text).
subtitle        | no  | string   | A short tagline thats displayed below the name of the name field.
allow_rating    | no  | boolean  | A boolean value indicating if end-users can rate this `CustomListItem`.
import_id       | no  | string     | A string field you can use to input your own identifier.  This is for when you have your own IDs for `CustomListItems` in your data store.
locations       | no  | array of integers | Array of IDs of `Locations` this `Session` should belong to.  See section on [Locations](#locations).
image           | no  | image    |  image will appear with the `CustomListItem` in Guidebook apps. The ideal size is 640px wide, 240 px tall. See section on [images](#images).
thumbnail       | no  | thumbnail  |  thumbnail will appear with the `CustomListItem` in Guidebook apps. The ideal size is 240px wide, 240 px tall. See section on [images](#images).


## Listing `CustomListItems`


```python
import requests

custom_list_item_url =  'https://builder.guidebook.com/open-api/v1/custom-list-items/'
api_key = 'API_KEY'

# This will return all `CustomListItems` you have access to
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
			"created_at": "2017-09-27T08:11:40.183229+0000",
			"image": null,
			"thumbnail": null
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
			"created_at": "2017-09-27T08:11:40.189964+0000",
			"image": null,
			"thumbnail": null
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
			"created_at": "2017-09-27T08:11:40.195613+0000",
			"image": null,
			"thumbnail": null
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
			"created_at": "2017-09-27T08:11:40.200571+0000",
			"image": null,
			"thumbnail": null
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


### Filtering data by `Guide` id and other fields

Including a query parameter `guide` allows you to filter for all `CustomListItems` related to a `Guide` you have access to (`Guide` 47 in this example):

`GET https://builder.guidebook.com/open-api/v1/custom-list-items/?guide=47`

You are also able to filter by the fields `custom_lists`, `import_id`, and `id` if you want to fetch a list of `CustomListItems` fitting specific criteria. See example below for how to filter on to these fields and combining multiple filters:

`GET https://builder.guidebook.com/open-api/v1/custom-list-items/?guide=47&custom_lists=12`

`GET https://builder.guidebook.com/open-api/v1/custom-list-items/?guide=47&id=44859`

`GET https://builder.guidebook.com/open-api/v1/custom-list-items/?guide=47&import_id=my_custom_id_a123`

### Sorting Returned Data

When fetching a list of your `CustomListItems`, you're also able to control the order of the returned data if this is important for your needs.  The only field you can currently sort by is `id`. The following example will sort all `CustomListItems` from `Guide` 47 by `id` in numerical order:

`GET https://builder.guidebook.com/open-api/v1/custom-list-items/?guide=47&ordering=id`

Prepending `-` in front of an ordering field reverses it.  The following example with sort in reverse:

`GET https://builder.guidebook.com/open-api/v1/custom-list-items/?guide=47&ordering=-id`


## Retrieving a `CustomListItem`
In the following examples, we will assume that the id of the `CustomListItem` we'd like to modify is 71.
To retrieve an individual `CustomListItem` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/custom-list-items/71/`

## Updating a `CustomListItem`

To modify an existing `CustomListItems` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1/custom-list-items/71/`

You will only need to include the specific fields you are updating and not a full request body.

## Deleting a `CustomListItem`

To delete a particular `CustomListItem`, issue a `DELETE` request to the url that points to the specific `CustomListItem` you'd like deleted:

`DELETE https://builder.guidebook.com/open-api/v1/custom-list-items/71/`
