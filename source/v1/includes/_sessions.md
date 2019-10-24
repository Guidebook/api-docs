# Sessions

`Sessions` can be added to a `Guide` to build up a schedule for your event. For example, the, "Programmer Conference 2017" event might have a `Session` for the talk, "Python in a Scientific Environment", and a `Session` about, "Off by One Errors."

## Creating `Session`


```python
import requests

session_url =  'https://builder.guidebook.com/open-api/v1/sessions/'
api_key = 'API_KEY'
post_data =
{
	"start_time": "2017-09-18T16:00:00",
	"end_time": "2017-09-18T17:00:00",
	"guide": 1,
	"description_html": "<p>This is a description field that supports basic HTML</p>",
	"name": "Test Session Created via the Open API"
}

response_1 = request.post(session_url, data=post_data, headers={'Authorization': 'JWT ' + api_key}).json()

# example with `ScheduleTracks`
post_data =
{
	"start_time": "2017-09-18T16:00:00",
	"end_time": "2017-09-18T17:00:00",
	"guide": 1,
	"description_html": "<p>This is a description field that supports basic HTML</p>",
	"name": "Test Session Created via the Open API",
	"schedule_tracks": [3, 42, 47, 101]
}

response_2 = request.post(session_url, data=post_data, headers={'Authorization': 'JWT ' + api_key}).json()

# example with `Locations`

post_data =
{
	"start_time": "2017-09-18T16:00:00",
	"end_time": "2017-09-18T17:00:00",
	"guide": 1,
	"description_html": "<p>This is a description field that supports basic HTML</p>",
	"name": "Test Session Created via the Open API",
	"locations": [3, 42, 47, 101]
}

response_3 = request.post(session_url, data=post_data, headers={'Authorization': 'JWT ' + api_key}).json()
```

> The above commands return JSON structured like this:

```json
{
	"id": 106,
	"created_at": "2017-09-18T22:13:25.766623+0000",
	"start_time": "2017-09-18T16:00:00.000000+0000",
	"end_time": "2017-09-18T17:00:00.000000+0000",
	"all_day": false,
	"name": "Test Session Created via the Open API",
	"description_html": "<p>This is a description field that supports basic HTML</p>",
	"import_id": null,
	"allow_rating": true,
	"add_to_schedule": true,
	"guide": 1,
	"locations": [],
	"schedule_tracks": [],
	"image": null,
	"rank": 0.0
}

# example with `ScheduleTracks`
{
	"id": 106,
	"created_at": "2017-09-18T22:13:25.766623+0000",
	"start_time": "2017-09-18T16:00:00.000000+0000",
	"end_time": "2017-09-18T17:00:00.000000+0000",
	"all_day": false,
	"name": "Test Session Created via the Open API",
	"description_html": "<p>This is a description field that supports basic HTML</p>",
	"import_id": null,
	"allow_rating": true,
	"add_to_schedule": true,
	"guide": 1,
	"locations": [],
	"schedule_tracks": [3, 42, 47, 101],
	"image": null,
	"rank": 0.0
}


# example with `Locations`
{
	"id": 106,
	"created_at": "2017-09-18T22:13:25.766623+0000",
	"start_time": "2017-09-18T16:00:00.000000+0000",
	"end_time": "2017-09-18T17:00:00.000000+0000",
	"all_day": false,
	"name": "Test Session Created via the Open API",
	"description_html": "<p>This is a description field that supports basic HTML</p>",
	"import_id": null,
	"allow_rating": true,
	"add_to_schedule": true,
	"guide": 1,
	"locations": [3, 42, 47, 101],
	"schedule_tracks": [],
	"image": null,
	"rank": 0.0
}

```


This endpoint will create a `Session` for your `Guide`.

### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/sessions/`

### Model Fields

Parameter       | Required  | Type    | Description
---------       | --------  | ------- | -----------
guide           | yes | integer  | The specific `Guide` your `Session` belongs to.  See section on [Guides](#guides) for more info.
name            | yes | string   | The title of your `Session`.
description_html| yes | string   | A text description of the `Session`.  This field has a 20,000 character limit.  This field supports basic HTML.  See section on [html text](#html-text).
start_time      | yes | datetime | The start time of the event. For consistency, all timestamps are converted to the UTC timezone.
end_time        | no  | datetime | The end time of the event.  Leave blank for all day events. For consistency, all timestamps are converted to the UTC timezone.
all_day         | no  | boolean  | A boolean value indicating if a `Session` runs for the entire day.
allow_rating    | no  | boolean  | A boolean value indicating if end-users can rate this `Session`.
add_to_schedule | no  | boolean  | A boolean value indicating if end-users can add this `Session` to their personal schedule.
import_id       | no  | string     | A string field you can use to input your own identifier.  This is for when you have your own IDs for `Sessions` in your data store.
locations       | no  | array of integers | Array of IDs of `Locations` this `Session` should belong to.  See section on [Locations](#locations).
schedule_tracks | no  | array of integers | Array of IDs of `ScheduleTracks` this `Session` should belong to.  See section on [ScheduleTracks](#scheduletracks).
image           | no  | image    |  image will appear above the `Session` name, date, times, location, and description in Guidebook apps. The ideal size is 640px wide, 240 px tall. See section on [images](#images).
rank 			| no | float  | The order the `Session` will appear.


<aside class="success">
Remember — don't forget to include your API key in the `Authorization` header!
</aside>


## Listing `Sessions`


```python
import requests

session_url =  'https://builder.guidebook.com/open-api/v1/sessions/'
api_key = 'API_KEY'

# This will return all `Sessions` you have access to
response = request.get(session_url, headers={'Authorization': 'JWT ' + api_key})
```

> The above command returns JSON structured like this:

```json
{
	"count": 4,
	"next": null,
	"previous": null,
	"results": [
		{
			"id": 21,
			"created_at": "2017-09-18T21:28:35.429989+0000",
			"start_time": "2017-09-18T21:28:35.428248+0000",
			"end_time": "2017-09-18T22:28:35.428257+0000",
			"all_day": false,
			"name": "Test Session 1",
			"description_html": null,
			"import_id": null,
			"allow_rating": true,
			"add_to_schedule": true,
			"guide": 42,
			"locations": [],
			"schedule_tracks": [],
			"image": null,
			"rank": 0.0
		},
		{
			"id": 22,
			"created_at": "2017-09-18T21:28:35.432366+0000",
			"start_time": "2017-09-18T21:28:35.431034+0000",
			"end_time": "2017-09-18T22:28:35.431042+0000",
			"all_day": false,
			"name": "Test Session 2",
			"description_html": null,
			"import_id": null,
			"allow_rating": true,
			"add_to_schedule": true,
			"guide": 42,
			"locations": [],
			"schedule_tracks": [],
			"image": null,
			"rank": 0.0
		},
		{
			"id": 23,
			"created_at": "2017-09-18T21:28:35.434402+0000",
			"start_time": "2017-09-18T21:28:35.433197+0000",
			"end_time": "2017-09-18T22:28:35.433205+0000",
			"all_day": false,
			"name": "Test Session 3",
			"description_html": null,
			"import_id": null,
			"allow_rating": true,
			"add_to_schedule": true,
			"guide": 42,
			"locations": [],
			"schedule_tracks": [],
			"image": null,
			"rank": 0.0
		},
		{
			"id": 24,
			"created_at": "2017-09-18T21:28:35.436433+0000",
			"start_time": "2017-09-18T21:28:35.435265+0000",
			"end_time": "2017-09-18T22:28:35.435273+0000",
			"all_day": false,
			"name": "Test Session 4, Different Guide",
			"description_html": null,
			"import_id": null,
			"allow_rating": true,
			"add_to_schedule": true,
			"guide": 43,
			"locations": [],
			"schedule_tracks": [],
			"image": null,
			"rank": 0.0
		}
	]
}

```


This endpoint can also be used to read data on `Sessions`.

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/sessions/`

### Model Fields

Same as the fields used in creation with the addition of the following read-only fields:

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | An unique identifier for your `Session`.
created_at      | datetime | Time when this `Session` was created - UTC.


### Filtering data by `Guide` id and other fields

Including a query parameter `guide` allows you to filter for all `Sessions` related to a `Guide` you have access to (`Guide` 47 in this example):

`GET https://builder.guidebook.com/open-api/v1/sessions/?guide=47`

You are also able to filter by the fields `schedule_tracks`, `import_id`, and `id` if you want to fetch a list of `Sessions` fitting specific criteria.  See example below for how to filter on to these fields and combining multiple filters:

`GET https://builder.guidebook.com/open-api/v1/sessions/?guide=47&schedule_tracks=3`

`GET https://builder.guidebook.com/open-api/v1/sessions/?guide=47&id=8673`

`GET https://builder.guidebook.com/open-api/v1/sessions/?guide=47&import_id=my_custom_id_a123`

### Sorting Returned Data

When fetching a list of your `Sessions`, you're also able to control the order of the returned data if this is important for your needs.  The fields that you can sort by are `id`, `start_time`, and `end_time`. The following example will sort all `Sessions` from `Guide` 47 by `start_time` in chronological order:

`GET https://builder.guidebook.com/open-api/v1/sessions/?guide=47&ordering=start_time`

Prepending `-` in front of an ordering field reverses it.  The following example with sort by `end_time` in reverse chronological order and then do a secondary sort by `start_time`:

`GET https://builder.guidebook.com/open-api/v1/sessions/?guide=47&ordering=-end_time,start_time`

## Retrieving a `Session`
In the following examples, we will assume that the id of the `Session` we'd like to modify is 71.
To retrieve an individual `Session` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/sessions/71/`

## Updating a `Session`

To modify an existing `Session` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1/sessions/71/`

You will only need to include the specific fields you are updating and not a full request body.

## Deleting a `Session`

To delete a particular `Session`, issue a `DELETE` request to the url that points to the specific `Session` you'd like deleted:

`DELETE https://builder.guidebook.com/open-api/v1/sessions/71/`
