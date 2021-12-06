# Inboxes

`Inboxes` are used to store `Messages` to your `Attendees`.  At this current point in time, only GET operations are allowed for the `Inbox` object.


## Listing `Inboxes`


```python
import requests

inboxes_list_url =  'https://builder.guidebook.com/open-api/v1/inboxes/'
api_key = 'API_KEY'

# This will return all inboxes you have access to
response = request.get(inboxes_list_url, headers={'Authorization': 'JWT ' + api_key})
```

> The above command returns JSON structured like this:

```json
{
  "count": 3,
  "next": null,
  "previous": null,
  "results": [
    {
      "id": 172,
      "guide": 395,
      "name": "test box 1"
    },
    {
      "id": 173,
      "guide": 395,
      "name": "test box 2"
    },
    {
      "id": 174,
      "guide": 395,
      "name": "test box 3"
    }
  ]
}
```

This endpoint can be used to list `Inbox` data. Typically, this endpoint is called with a `guide` filter such that it returns a list of `Inboxes` associated to a lone `Guide` object that is owned by you.

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/inboxes/`

### Model Fields

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | An unique identifier for your `Inbox`.
guide           | integer  | The specific `Guide` your `Inbox` belongs to.  See section on [Guides](#guides) for more info.
name            | string    | A string to identify your `Inbox` with.

### Filtering data by `Guide` id

Including a query parameter `guide` allows you to filter for all `Inboxes` related to a `Guide` you have access to (`Guide` 47 in the following example):

`GET https://builder.guidebook.com/open-api/v1/inboxes/?guide=47`

## Retrieving an `Inbox`

To retrieve an individual `Inbox` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/inboxes/71/`

The above request will fetch data for the `Inbox` with the id 71.

