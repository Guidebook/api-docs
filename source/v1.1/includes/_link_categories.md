# Link Categories

The `LinkCategory` object is used to group together `Links` for display.   `LinkCategory` objects are automatically managed as part of the creation of `Link` objects. Create operations are therefore not allowed on this object.  You will only able to list, update, and delete `LinkCategory` objects via the API.

## Listing `LinkCategories`



```python
import requests

link_category_url =  'https://builder.guidebook.com/open-api/v1.1/link-categories/?guide=1'
api_key = 'API_KEY'

# This will return all `Links` you have access to
response = requests.get(link_category_url, headers={'Authorization': 'JWT ' + api_key})
```

> The above command returns JSON structured like this:

```json
{
	"count": 5,
	"next": null,
	"previous": null,
	"results": [
		{
			"id": 7,
			"name": "Sessions",
			"_name": "Sessions",
			"links": [
				{
					"id": 9,
					"guide": 1,
					"source_content_type": "schedule.session",
					"target_content_type": "schedule.session",
					"source_object_id": 7,
					"target_object_id": 9,
					"created_at": "2018-06-27T15:56:28.678935+0000",
					"rank": 0.0,
					"title": "session C",
					"description": {
						"start_time": "2018-06-27 15:56:28.641592+00:00",
						"end_time": "2018-06-27 16:56:28.641600+00:00"
					},
					"category_detail": {
						"id": 7,
						"name": "Sessions",
						"_name": "Sessions",
						"created_at": "2018-06-27T15:56:28.651231+0000",
						"rank": 1.0,
						"guide": 1
					},
					"_title": null,
					"_description": null
				},
				{
					"id": 7,
					"guide": 1,
					"source_content_type": "schedule.session",
					"target_content_type": "schedule.session",
					"source_object_id": 7,
					"target_object_id": 8,
					"created_at": "2018-06-27T15:56:28.659284+0000",
					"rank": 0.0,
					"title": "session B",
					"description": {
						"start_time": "2018-06-27 15:56:28.639726+00:00",
						"end_time": "2018-06-27 16:56:28.639733+00:00"
					},
					"category_detail": {
						"id": 7,
						"name": "Sessions",
						"_name": "Sessions",
						"created_at": "2018-06-27T15:56:28.651231+0000",
						"rank": 1.0,
						"guide": 1
					},
					"_title": null,
					"_description": null
				}
			],
			"created_at": "2018-06-27T15:56:28.651231+0000",
			"rank": 1.0,
			"guide": 1
		},
		{
			"id": 8,
			"name": "Sessions",
			"_name": "Sessions",
			"links": [
				{
					"id": 8,
					"guide": 1,
					"source_content_type": "schedule.session",
					"target_content_type": "schedule.session",
					"source_object_id": 8,
					"target_object_id": 7,
					"created_at": "2018-06-27T15:56:28.669642+0000",
					"rank": 0.0,
					"title": "session A",
					"description": {
						"start_time": "2018-06-27 15:56:28.637319+00:00",
						"end_time": "2018-06-27 16:56:28.637328+00:00"
					},
					"category_detail": {
						"id": 8,
						"name": "Sessions",
						"_name": "Sessions",
						"created_at": "2018-06-27T15:56:28.663602+0000",
						"rank": 1.0,
						"guide": 1
					},
					"_title": null,
					"_description": null
				}
			],
			"created_at": "2018-06-27T15:56:28.663602+0000",
			"rank": 1.0,
			"guide": 1
		},
		{
			"id": 9,
			"name": "Sessions",
			"_name": "Sessions",
			"links": [
				{
					"id": 10,
					"guide": 1,
					"source_content_type": "schedule.session",
					"target_content_type": "schedule.session",
					"source_object_id": 9,
					"target_object_id": 7,
					"created_at": "2018-06-27T15:56:28.692462+0000",
					"rank": 0.0,
					"title": "session A",
					"description": {
						"start_time": "2018-06-27 15:56:28.637319+00:00",
						"end_time": "2018-06-27 16:56:28.637328+00:00"
					},
					"category_detail": {
						"id": 9,
						"name": "Sessions",
						"_name": "Sessions",
						"created_at": "2018-06-27T15:56:28.685621+0000",
						"rank": 1.0,
						"guide": 1
					},
					"_title": null,
					"_description": null
				}
			],
			"created_at": "2018-06-27T15:56:28.685621+0000",
			"rank": 1.0,
			"guide": 1
		},
		{
			"id": 10,
			"name": "Sessions",
			"_name": "Sessions",
			"links": [
				{
					"id": 11,
					"guide": 1,
					"source_content_type": "schedule.session",
					"target_content_type": "schedule.session",
					"source_object_id": 10,
					"target_object_id": 11,
					"created_at": "2018-06-27T15:56:28.703571+0000",
					"rank": 0.0,
					"title": "session E",
					"description": {
						"start_time": "2018-06-27 15:56:28.645808+00:00",
						"end_time": "2018-06-27 16:56:28.645820+00:00"
					},
					"category_detail": {
						"id": 10,
						"name": "Sessions",
						"_name": "Sessions",
						"created_at": "2018-06-27T15:56:28.697603+0000",
						"rank": 1.0,
						"guide": 1
					},
					"_title": null,
					"_description": null
				}
			],
			"created_at": "2018-06-27T15:56:28.697603+0000",
			"rank": 1.0,
			"guide": 1
		},
		{
			"id": 11,
			"name": "Sessions",
			"_name": "Sessions",
			"links": [
				{
					"id": 12,
					"guide": 1,
					"source_content_type": "schedule.session",
					"target_content_type": "schedule.session",
					"source_object_id": 11,
					"target_object_id": 10,
					"created_at": "2018-06-27T15:56:28.714641+0000",
					"rank": 0.0,
					"title": "session D",
					"description": {
						"start_time": "2018-06-27 15:56:28.643482+00:00",
						"end_time": "2018-06-27 16:56:28.643489+00:00"
					},
					"category_detail": {
						"id": 11,
						"name": "Sessions",
						"_name": "Sessions",
						"created_at": "2018-06-27T15:56:28.707867+0000",
						"rank": 1.0,
						"guide": 1
					},
					"_title": null,
					"_description": null
				}
			],
			"created_at": "2018-06-27T15:56:28.707867+0000",
			"rank": 1.0,
			"guide": 1
		}
	]
}

```

This endpoint can be used to read data on `LinkCategories`.
The `guide` filter is required.

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1.1/link-categories/?guide=<guide_id>`

### Model Fields


Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | An unique identifier for your `LinkCategory`.
created_at      | datetime | Time when this `LinkCategory` was created - UTC.
name            | string   | Title that will be displayed in the app.  To change this, please use the _name field.
_name           | string   |  Used to override default title.
links           | list       | List of the `Link` objects displayed in this category
rank            | float       | The order the `LinkCategory` will appear in the `Links` section on the app.  `LinkCategories` are displayed in ascending rank value.  If no rank value is supplied on creation, a default rank is used.


Including a query parameter `guide` allows you to filter for all `LinkCategories` related to a `Guide` you have access to (`Guide` 47 in this example):

`GET https://builder.guidebook.com/open-api/v1.1/link-categories/?guide=47`


## Retrieving a `LinkCategory`
In the following examples, we will assume that the id of the `LinkCategory` we'd like to modify is 71.
To retrieve an individual `LinkCategory` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1.1/link-categories/71/`

## Updating a `LinkCategory`

To modify an existing `Link` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1.1/link-categories/71/`

You will only need to include the specific fields you are updating and not a full request body.

## Deleting a `LinkCategory`

Deleting the last `Link` in a `LinkCategory` will auto delete the `LinkCategory` so you usually will not to perform this action.
To delete a particular `LinkCategory`, issue a `DELETE` request to the url that points to the specific `LinkCategory` you'd like deleted:

`DELETE https://builder.guidebook.com/open-api/v1.1/link-categories/71/`
