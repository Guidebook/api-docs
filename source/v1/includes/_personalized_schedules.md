# PersonalizedSchedules

## Creating a `PersonalizedSchedule`


```python
import requests

personalized_schedule_url =  'https://builder.guidebook.com/open-api/v1/personalized-schedules/'
api_key = 'API_KEY'
post_data =
{
	"guide": 1,
	"name": "Test Personalized Schedule Created via the Open API",
	"attendees": [
		1,
		5
	],
	"sessions": [
		13,
		42,
		47,
		101,
		118
	]
}
response = request.post(personalized_schedule_url, data=post_data, headers={'Authorization': 'JWT ' + api_key})

```

> The above command returns JSON structured like this:

```json
{
	"id": 1,
	"guide": 18,
	"name": "Test Personalized Schedule Created via the Open API",
	"attendees": [
		1,
		5
	],
	"sessions": [
		13,
		42,
		47,
		101,
		118
	]
}

```


This endpoint will create a `PersonalizedSchedule` for your guide.

### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/personalized-schedules/`

### Model Fields

Parameter       | Required  | Type    | Description
---------       | --------  | ------- | -----------
guide           | yes | integer  | The specific guide your `PersonalizedSchedule` belongs to.  See section on [Guides](#guides) for more info.
name            | yes | string   | The title of your `PersonalizedSchedule`.
attendees       | yes | array of integers | Array of IDs of `Attendees` this `PersonalizedSchedule` will be assigned to.  See section on [Attendees](#attendees).
sessions       | yes | array of integers | Array of IDs of `Sessions` this `PersonalizedSchedule` will contain.  See section on [Sessions](#sessions).



## Listing `PersonalizedSchedule`


```python
import requests

personalized_schedule_url =  'https://builder.guidebook.com/open-api/v1/personalized-schedules/'
api_key = 'API_KEY'

# This will return all `PersonalizedSchedule` you have access to
response = request.get(personalized_schedule_url, headers={'Authorization': 'JWT ' + api_key})
```

> The above command returns JSON structured like this:

```json
{
	"count": 2,
	"next": null,
	"previous": null,
	"results": [
		{
			"id": 1,
			"guide": 18,
			"name": "Example Schedule for Sales Team",
			"attendees": [
				6,
				7,
				8
			],
			"sessions": [
				1,
				2,
				3
			]
		},
		{
			"id": 2,
			"guide": 19,
			"name": "Example Schedule for Marketing Team",
			"attendees": [
				9,
				10,
				11
			],
			"sessions": [
				4,
				5,
				6
			]
		}
	]
}
```


This endpoint can also be used to read data on `PersonalizedSchedule`.

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/personalized-schedules/`

### Model Fields

Same as the fields used in creation with the addition of the following read-only fields

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | An unique identifier for your `PersonalizedSchedule`.
created_at      | datetime | Time when this `PersonalizedSchedule` was created - UTC.

### Filtering By Guide id

Including a query parameter `guide` allows you to filter for all `PersonalizedSchedule` related to a `Guide` you have access to (`Guide` 47 in the following example):

`GET https://builder.guidebook.com/open-api/v1/personalized-schedules/?guide=47`

## Retrieving a `PersonalizedSchedule`

In the following examples, we will assume that the id of the `PersonalizedSchedule` we'd like to modify is 71.
To retrieve an individual `PersonalizedSchedule` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/personalized-schedules/71/`

## Updating a `PersonalizedSchedule`

To modify an existing `PersonalizedSchedule` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1/personalized-schedules/71/`

The only fields you will be able to update are `sessions` and `attendees`.  Note that due to the complexity of `PersonalizedSchedules`, you'll need to sign into Builder UI and review the updates and publish updates to the app.  Publishing these updates is not available via the Open API at this moment.

## Deleting a `PersonalizedSchedule`

To delete a particular `PersonalizedSchedule`, issue a `DELETE` request to the url that points to the specific `PersonalizedSchedule` you'd like deleted:

`DELETE https://builder.guidebook.com/open-api/v1/personalized-schedules/71/`

## Publishing `PersonalizedSchedules`
`PersonalizedSchedules` can be published for an entire guide, or for a specific attendee. To publish all schedules for a guide, see [Publishing Personalized Schedules for a Guide](#publishing-code-personalizedschedules-code-for-a-code-guide-code). To publish a schedule for a specific attendee, see [Publishing Personalized Schedules for Attendees](#publishing-a-code-personalizedschedule-code-for-an-code-attendee-code).
