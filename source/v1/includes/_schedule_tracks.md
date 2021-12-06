# ScheduleTracks

`ScheduleTracks` allow you to build a filtered view of your schedule. A `ScheduleTrack` contains a subset of the `Sessions` in your `Guide`. For the event, "Programmer Conference 2017" you might, for example, have a `ScheduleTrack` for `Sessions` about Python, and a `ScheduleTrack` for `Sessions` about Java.

## Creating a `ScheduleTrack`


```python
import requests

schedule_tracks_url =  'https://builder.guidebook.com/open-api/v1/schedule-tracks/'
api_key = 'API_KEY'
post_data =
{
	"guide": 1,
	"name": "Test Schedule Track Created via the Open API",
	"color": "#000080"
}
response = request.post(schedule_tracks_url, data=post_data, headers={'Authorization': 'JWT ' + api_key})

```

> The above command returns JSON structured like this:

```json
{
	"id": 234,
	"guide": 1,
	"name": "Test Schedule Track Created via the Open API",
	"color": "#000080",
	"created_at": "2017-09-21T21:28:35.432366+0000",
	"import_id": null
}


```


This endpoint will create a `ScheduleTrack` for your guide.

### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/schedule-tracks/`

### Model Fields

Parameter       | Required  | Type    | Description
---------       | --------  | ------- | -----------
guide           | yes | integer  | The specific guide your `ScheduleTrack` belongs to.  See section on [Guides](#guides) for more info.
name            | yes | string   | The title of your `ScheduleTrack`.
color           | no  | string   | Hex value of the color you want this track to be. Used for highlighting sessions in the app. Example: "#000080" for blue.
import_id       | no  | string     | A string field you can use to input your own identifier.  This is for when you have your own IDs for `ScheduleTracks` in your data store.


## Listing `ScheduleTracks`


```python
import requests

schedule_tracks_url =  'https://builder.guidebook.com/open-api/v1/schedule-tracks/'
api_key = 'API_KEY'

# This will return all `ScheduleTracks` you have access to
response = request.get(schedule_tracks_url, headers={'Authorization': 'JWT ' + api_key})
```

> The above command returns JSON structured like this:

```json
{
	"count": 4,
	"next": null,
	"previous": null,
	"results": [
		{
			"id": 210,
			"guide": 308,
			"name": "Test Track 1",
			"color": null,
			"import_id": null,
			"created_at": "2017-09-10T21:28:35.432366+0000"
		},
		{
			"id": 211,
			"guide": 308,
			"name": "Test Track 2",
			"color": null
		},
		{
			"id": 212,
			"guide": 308,
			"name": "Test Track 3",
			"color": null,
			"import_id": null,
			"created_at": "2017-09-11T21:28:35.432366+0000"
		},
		{
			"id": 213,
			"guide": 309,
			"name": "Test Track 4, Different Guide",
			"color": null,
			"import_id": null,
			"created_at": "2017-09-12T21:28:35.432366+0000"
		}
	]
}

```


This endpoint can also be used to read data on `ScheduleTracks`.

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/schedule-tracks/`

### Model Fields

Same as the fields used in creation with the addition of the following read-only fields:

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | An unique identifier for your `ScheduleTrack`.
created_at      | datetime | Time when this `ScheduleTrack` was created - UTC.


### Filtering By Guide id and other fields

Including a query parameter `guide` allows you to filter for all `ScheduleTracks` related to a `Guide` you have access to (`Guide` 47 in the following example):

`GET https://builder.guidebook.com/open-api/v1/schedule-tracks/?guide=47`

You are also able to filter by the fields `import_id` and `id` if you want to fetch a list of `ScheduleTracks` fitting specific criteria. See the examples below for how to filter on these fields:

`GET https://builder.guidebook.com/open-api/v1/schedule-tracks/?guide=47&id=8673`

`GET https://builder.guidebook.com/open-api/v1/schedule-tracks/?guide=47&import_id=my_custom_id_a123`

## Retrieving a `ScheduleTrack`
In the following examples, we will assume that the id of the `ScheduleTrack` we'd like to modify is 71.
To retrieve an individual `ScheduleTrack` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/schedule-tracks/71/`

## Updating a `ScheduleTrack`

To modify an existing `ScheduleTracks` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1/schedule-tracks/71/`

You will only need to include the specific fields you are updating and not a full request body.

## Deleting a `ScheduleTrack`

To delete a particular `ScheduleTrack`, issue a `DELETE` request to the url that points to the specific `ScheduleTrack` you'd like deleted:

`DELETE https://builder.guidebook.com/open-api/v1/schedule-tracks/71/`
