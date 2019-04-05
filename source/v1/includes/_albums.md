# Albums

`Albums` are used to store `Photos` in your `Guide`.


## Creating `Albums`


```python
import requests

albums_url =  'https://builder.guidebook.com/open-api/v1/albums/'
api_key = 'API_KEY'
post_data =
{
    "guide": 1,
    "name": "My Photo Album"
}
response = request.post(albums_url, data=post_data, headers={'Authorization': 'JWT ' + api_key})

```

> The above command returns JSON structured like this:

```json
{
    "id": 8,
    "guide": 1,
    "name": "My Photo Album",
    "read_only": false
}

```


### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/albums/`

### Model Fields

Parameter       | Required  | Type    | Description
---------       | --------  | ------- | -----------
guide           | yes | integer  | The specific `Guide` your `Album` belongs to.  See section on [Guides](#guides) for more info.
name            | yes | string   | The title of your `Album`.
read_only	    | no  | boolean   | A booelan value that indicates whether or not users are allowed to upload `Photos` to this `Album`.


## Listing `Albums`

This endpoint can be used to list `Album` data. Typically, this endpoint is called with a `guide` filter such that it returns a list of `Albums` associated to a lone `Guide` object that is owned by you.


```python
import requests

albums_url =  'https://builder.guidebook.com/open-api/v1/albums/'
api_key = 'API_KEY'

# This will return all albums you have access to
response = request.get(albums_url, headers={'Authorization': 'JWT ' + api_key})
```

> The above command returns JSON structured like this:

```json
{
    "count": 3,
    "next": null,
    "previous": null,
    "results": [
        {
            "id": 6,
            "guide": 6,
            "name": "Photo Album",
            "read_only": false
        },
        {
            "id": 7,
            "guide": 7,
            "name": "Photo Album",
            "read_only": false
        },
        {
            "id": 8,
            "guide": 1,
            "name": "My Photo Album",
            "read_only": false
        }
    ]
}
```


### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/albums/`

### Model Fields

Same as the fields used in creation with the addition of the following read-only field

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | An unique identifier for your `Album`.


### Filtering By `Guide` id

Including a query parameter `guide` allows you to filter for all `Albums` related to a `Guide` you have access to (`Guide` 47 in the following example):

`GET https://builder.guidebook.com/open-api/v1/albums/?guide=47`

## Retrieving an `Album`
In the following examples, we will assume that the id of the `Album` we'd like to modify is 71.
To retrieve an individual `Album` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/albums/71/`

## Updating an `Album`

To modify an existing `Album` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1/albums/71/`

You will only need to include the specific fields you are updating and not a full request body.

## Deleting an `Album`

To delete a particular `Album`, issue a `DELETE` request to the url that points to the specific `Album` you'd like deleted:

`DELETE https://builder.guidebook.com/open-api/v1/albums/71/`