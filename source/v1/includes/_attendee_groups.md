# AttendeeGroups

`AttendeeGroups` allow you to collect 1 or more `Attendee` objects into a group.

## Creating an `AttendeeGroup`


```python
import requests

attendee_groups_list_url =  'https://builder.guidebook.com/open-api/v1/attendee-groups/'
api_key = 'API_KEY'
post_data =
{
	"guide": 1,
	"name": "Test AttendeeGroup created via the Open API"
}

response = request.post(attendee_groups_list_url, data=post_data, headers={'Authorization': 'JWT ' + api_key})

```

> The above command returns JSON structured like this:

```json
{
	"id": 1,
  "guide": 1,
  "name": "Test AttendeeGroup created via the Open API",
	"created_at": "2017-11-18T22:13:25.766623+0000"
}


```

This endpoint will create an `AttendeeGroup` that belongs to the given `Guide`. `AttendeeGroups` allow you to collect 1 or more `Attendee` objects into a group.

### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/attendee-groups/`

### Model Fields

Parameter       | Required  | Type    | Description
---------       | --------  | ------- | -----------
guide           | yes | integer  | The specific `Guide` your `AttendeeGroup` belongs to.  See section on [Guides](#guides) for more info.
name            | yes | string    | A string to identify your `AttendeeGroup` with.


## Listing `AttendeeGroups`


```python
import requests

attendee_groups_list_url =  'https://builder.guidebook.com/open-api/v1/attendee-groups/'
api_key = 'API_KEY'

# This will return all AttendeeGroups you have access to
response = request.get(attendee_groups_list_url, headers={'Authorization': 'JWT ' + api_key})
```

> The above command returns JSON structured like this:

```json
{
	"count": 3,
	"next": null,
	"previous": null,
	"results": [
		{
			"id": 1,
			"guide": 1,
      "name": "AttendeeGroup Example 1",
			"created_at": "2017-09-18T21:28:35.429989+0000"
		},
		{
      "id": 2,
			"guide": 1,
      "name": "AttendeeGroup Example 2",
			"created_at": "2017-10-18T21:28:35.429989+0000"
		},
    {
      "id": 3,
			"guide": 1,
      "name": "AttendeeGroup Example 3",
			"created_at": "2017-11-18T21:28:35.429989+0000"
		}
	]
}

```

This endpoint can also be used to read `AttendeeGroup` data. Typically, this endpoint is called with a `guide` filter such that it returns a list of `Attendees` associated to a lone `Guide` object that is owned by you.

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/attendee-groups/`

### Model Fields

Same as the fields used in creation with the addition of the following read-only fields:

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | An unique identifier for your `AttendeeGroup`.
created_at      | datetime | Time when this `AttendeeGroup` was created - UTC.

### Filtering data by `Guide` id and other fields

Including a query parameter `guide` allows you to filter for all `AttendeeGroups` related to a `Guide` you have access to (`Guide` 47 in the following example):

`GET https://builder.guidebook.com/open-api/v1/attendee-groups/?guide=47`

## Retrieving an `AttendeeGroup`

To retrieve an individual `AttendeeGroup` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/attendee-groups/71/`

The above request will fetch data for the `AttendeeGroup` with the id 71.

## Retrieving the Attendees in an `AttendeeGroup`

To retrieve all the current `Attendees` in an `AttendeeGroup` objects, issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/attendee-groups/71/attendees/`

The above request (which can be paged through) will return representations of the `Attendee` objects currently in the `AttendeeGroup`.

## Adding `Attendees` to an `AttendeeGroup`

To add Attendees to an `AttendeeGroup`, issue a `POST` request like:

`POST https://builder.guidebook.com/open-api/v1/attendee-groups/71/add-attendees/`

The body of the POST request should be a dictionary like...`{"attendees": [<attendee_id_1>, <attendee_id_2>, <attendee_id_n>]}`.

## Removing `Attendees` from an `AttendeeGroup`

To remove Attendess from an `AttendeeGroup`, issue a `POST` request like:

`POST https://builder.guidebook.com/open-api/v1/attendee-groups/71/remove-attendees/`

The body of the POST request should be a dictionary like...`{"attendees": [<attendee_id_1>, <attendee_id_2>, <attendee_id_n>]}`.

## Updating an `AttendeeGroup`

To modify an existing `AttendeeGroup` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1/attendee-groups/71/`

You will only need to include the specific fields you are updating and not a full request body. Note than only the `name` field is updatable at this time.

## Deleting an `AttendeeGroup`

To delete a particular `AttendeeGroup`, issue a `DELETE` request to the url that points to the specific `AttendeeGroup` you'd like deleted:

`DELETE https://builder.guidebook.com/open-api/v1/attendee-groups/71/`
