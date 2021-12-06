# CustomLists

## Creating a `CustomList`


```python
import requests

custom_lists_url =  'https://builder.guidebook.com/open-api/v1/custom-lists/'
api_key = 'API_KEY'
post_data =
{
	"guide": 1,
	"name": "Test Custom List Created via the Open API"
}
response = request.post(custom_lists_url, data=post_data, headers={'Authorization': 'JWT ' + api_key})

```

> The above command returns JSON structured like this:

```json
{
	"id": 1,
	"import_id": null,
	"guide": 1,
	"name": "Test Custom List Created via the Open API",
	"disable_todo": false,
	"allow_rating": false,
	"created_at": "2017-09-27T07:38:58.471042+0000"
}

```


### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/custom-lists/`

### Model Fields

Parameter       | Required  | Type    | Description
---------       | --------  | ------- | -----------
guide           | yes | integer  | The specific `Guide` your `CustomList` belongs to.  See section on [Guides](#guides) for more info.
name            | yes | string   | The title of your `CustomList`. i.e (Exhibitors, Speakers, Places to Visit, etc).
disable_todo    | no  | boolean   | A booelan value that will hide the "Add to To-do" button for all items on this list.
allow_rating    | no  | boolean   |  A boolean value indicating if end-users can rate items in this `CustomList`.
import_id       | no  | string     | A string field you can use to input your own identifier.  This is for when you have your own IDs for your Lists in your data store.


## Listing `CustomLists`

This endpoint will list all `CustomLists` that are owned by your Account. Typically, this endpoint is called with a `guide_id` filter such that it returns a list of `CustomLists` associated to a lone `Guide` object that is owned by you.


```python
import requests

custom_lists_url =  'https://builder.guidebook.com/open-api/v1/custom-lists/'
api_key = 'API_KEY'

# This will return all custom lists you have access to
response = request.get(custom_lists_url, headers={'Authorization': 'JWT ' + api_key})
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
			"guide": 1,
			"name": "Test Custom List 1",
			"disable_todo": false,
			"allow_rating": true,
			"created_at": "2017-09-27T07:31:48.637192+0000"
		},
		{
			"id": 2,
			"import_id": null,
			"guide": 1,
			"name": "Test Custom List 2",
			"disable_todo": false,
			"allow_rating": true,
			"created_at": "2017-09-27T07:31:48.639373+0000"
		},
		{
			"id": 3,
			"import_id": null,
			"guide": 1,
			"name": "Test Custom List 3",
			"disable_todo": false,
			"allow_rating": true,
			"created_at": "2017-09-27T07:31:48.641850+0000"
		},
		{
			"id": 4,
			"import_id": null,
			"guide": 2,
			"name": "Test Custom List 4, Different Guide",
			"disable_todo": false,
			"allow_rating": true,
			"created_at": "2017-09-27T07:31:48.643872+0000"
		}
	]
}
```


### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/custom-lists/`

### Model Fields

Same as the fields used in creation with the addition of the following read-only fields

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | An unique identifier for your `CustomList`.
created_at      | datetime | Time when this `CustomList` was created - UTC.


### Filtering By `Guide` id

Including a query parameter `guide` allows you to filter for all `CustomLists` related to a `Guide` you have access to (`Guide` 47 in the following example):

`GET https://builder.guidebook.com/open-api/v1/custom-lists/?guide=47`

## Retrieving a `CustomList`
In the following examples, we will assume that the id of the `CustomList` we'd like to modify is 71.
To retrieve an individual `CustomList` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/custom-lists/71/`

## Updating a `CustomList`

To modify an existing `CustomList` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1/custom-lists/71/`

You will only need to include the specific fields you are updating and not a full request body.

## Deleting a `CustomList`

To delete a particular `CustomList`, issue a `DELETE` request to the url that points to the specific `CustomList` you'd like deleted:

`DELETE https://builder.guidebook.com/open-api/v1/custom-lists/71/`
