# Guides

Many of the resources exposed by the Guidebook Open API relate to a class of objects called `Guide`. `Guide` objects are typically containers for the set of data related to an event like a conference. For example, if you were hosting a conference called, "Programmer Summit 2017" you would likely have one `Guide` object that contained the schedule for the conference, a list of speakers for that conference, and a list of users who you expect to attend the conference.

As of now, `Guide` objects themselves are primarily managed via the [Guidebook Builder CMS](https://builder.guidebook.com) (and not via the Open API). Resources exposed by the Open API, however, will contain references to the id of `Guide` objects they belong to. For example, every `Session` object returned in the Open API will report the id of the one `Guide` that `Session` belongs to (e.g. `"guide": 1`). In general, resources cannot be transferred or otherwise shared amongst more than one `Guide` -- once a `Session` is created under a given `Guide` object, it lives under that `Guide` permanently and cannot be moved to a different `Guide`.

## Listing `Guides`

```python
import requests

guides_url = 'https://builder.guidebook.com/open-api/v1.1/guides/'
api_key = 'API_KEY'
response = requests.get(guides_url, headers={'Authorization': 'JWT ' + api_key}).json()
```

> The above command returns JSON structured like this:

```json
{
	"count": 2,
	"next": null,
	"previous": null,
	"results": [
		{
			"id": 21,
			"created_at": "2017-09-18T21:28:35.429989+0000",
			"name": "Programmer Summit 2017",
			"description_html": "TEST DESCRIPTION",
			"attendees_estimate": 1500,
			"start_date": "2017-05-22T21:00:00.000000+0000",
			"end_date": "2017-05-27T21:00:00.000000+0000",
			"owner": 412,
			"timezone": "UTC",
			"created_at": "2018-05-28T21:53:31.010760+0000",
			"short_name": "summit2017",
			"category": []
		},
		{
			"id": 22,
			"created_at": "2017-09-18T21:28:35.436433+0000",
			"name": "Programmer Summit 2018",
			"description_html": "<b>TEST DESCRIPTION 2018</b>",
			"attendees_estimate": null,
			"start_date": null,
			"end_date": null,
			"owner": 412,
			"timezone": "US/Pacific",
			"created_at": "2018-05-28T21:53:31.010760+0000",
			"short_name": "summit2018",
			"category": []
		}
	]
}
```

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1.1/guides/`

### Guide Properties

Property                | Type        | Description
---------               | --------    | --------
id                      | int         | id of the `Guide` object.
created_at              | datetime    | Time when `Guide` was created -- in UTC.
owner                   | int         | id of the `Account` User or Organization that owns the `Guide` object.
name                    | str         | Name of the `Guide`.
start_date              | datetime    | The start date of the `Guide`. For consistency, all timestamps are converted to the UTC timezone.  Leave blank for ongoing `Guides`.
end_date                | datetime    | The end date of the Guide.  Leave blank for ongoing `Guides`.
attendees_estimate      | int         | Estimated attendance of the Guide. Must be filled to publish.
description_html.       | string      | A description of the `Guide`.  This field supports basic HTML.  See section on [html text](#html-text).
timezone                | timezone    | `Session` times in this `Guide` will be converted to this timezone.  Check [this list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List) for valid timezone strings.
home_screen_menuitem    | int         | The id of the `MenuItem` you want on the homescreen of your `Guide`.
privacy                 | int         | Used for updating privacy options.  1 = Public Guide, 2 = Passphrase Guide, 3 = Invite Only Guide
redeem_code             | str         | Optional paramater used when updating privacy options.  If you choose privacy option 2, you'll need to supply the desired passphrase in this field.  Note tha we only allow redeem_codes to be updated once per hour.
short_name				| str 		  | The name used to construct the URL where people view your guide.
category                | array of integers | Array of IDs of `GuideCategories` this `Guide` is a part of.  See section on [GuideCategories](#guide-categories).


### Filtering `Guides` by `owner` id.

Including a query parameter `owner` allows you to filter for all `Guides` owned by a specific Account (`Account` 47 in this example):

`GET https://builder.guidebook.com/open-api/v1.1/guides/?owner=47`

### Filtering `Guides` by `category` id.

Including a query parameter `category__id` allows you to filter for all `Guides` belonging to a specific `GuideCategory` (`GuideCategory` 23 in this example):

`GET https://builder.guidebook.com/open-api/v1.1/guides/?category__id=23`

## Retrieving a `Guide`
In the following examples, we will assume that the id of the `Guide` we'd like to modify is 21.
To retrieve an individual `Guide` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1.1/guides/21/`


## Updating a `Guide`

To modify an existing `Guide` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1.1/guides/21/`

You will only need to include the specific fields you are updating and not a full request body.

## Creating/Deleting a `Guide`

We do not allow the `Create` or `Delete` operations for the `Guide` object via the Open API.  To perform these actions, please login to your account on the [Guidebook Builder CMS](https://builder.guidebook.com).

## Publishing a `Guide`

To publish an existing `Guide` object, issue a `POST` request like:

`POST https://builder.guidebook.com/open-api/v1.1/guides/21/publish/`

A successful request to this endpoint will return a status code of `202 ACCEPTED`. This endpoint has a rate limit of 2 requests per minute.

To be successfully published, the guide must currently be on a paid plan and cannot be archived. Note that the act of publishing a Guide does not guarantee that it will appear in your space. Please see the documentation on `Spaces` and `SpaceGuideAssociations` for more information.

## Publishing `PersonalizedSchedules` for a `Guide`

To publish all `PersonalizedSchedules` on a `Guide` object, issue a `POST` request like:

`POST https://builder.guidebook.com/open-api/v1.1/guides/21/publish-personalized-schedules/`

A successful request to this endpoint will return a status code of `202 ACCEPTED`

To successfully publish personalized schedules for a guide, the guide must be on a Premium service level and must already be published.


## Retrieving `Leaderboard` rankings for a `Guide`

To retrieve `Leaderboard` rankings for a `Guide`, issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1.1/guides/21/get-leaderboard-rankings/`

A successful request to this endpoint will return a status code of `200 OK`

This endpoint is paginated with a maximum `page_size` of 500. See the section on [Pagination] (#pagination). It defaults to returning user scores, but if you would like to retrieve scores by group, you can provide a query param in your request like:

`GET https://builder.guidebook.com/open-api/v1.1/guides/21/get-leaderboard-rankings/?scoring_entity=groups`
