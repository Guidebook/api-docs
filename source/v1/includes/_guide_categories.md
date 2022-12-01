# GuideCategories

## Creating a `GuideCategory`


```python
import requests

guide_categories_url =  'https://builder.guidebook.com/open-api/v1/guide-categories/'
api_key = 'API_KEY'
post_data =
{
    "name": "My Category",
    "description": "A Category for My Guides",
    "space": 3
}
response = request.post(guide_categories_url, data=post_data, headers={'Authorization': 'JWT ' + api_key})

```

> The above command returns JSON structured like this:

```json
{
    "id": 1,
    "name": "My Category",
    "description": "A Category for My Guides",
    "space": 3
}

```


### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/guide-categories/`

### Model Fields

Parameter       | Required  | Type    | Description
---------       | --------  | ------- | -----------
name            | yes | string   | The title of your `GuideCategory`.
space           | yes | integer   | The id of the space that this `GuideCategory` belongs to. See section on [Spaces](#spaces).
description     | no  | string   |  A description of this `GuideCategory`.


## Listing `GuideCategories`

This endpoint will list all `GuideCategories` that can be accessed by your Account.


```python
import requests

guide_categories_url =  'https://builder.guidebook.com/open-api/v1/guide-categories/'
api_key = 'API_KEY'

# This will return all guide categories you have access to
response = request.get(guide_categories_url, headers={'Authorization': 'JWT ' + api_key})
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
            "name": "My Category",
            "description": "A Category for My Guides",
            "space": 3
        },
        {
            "id": 2,
            "name": "My Second Category",
            "description": "A Second Category for My Guides",
            "space": 3
        },
        {
            "id": 3,
            "name": "My Third Category",
            "description": "A Third Category for My Guides",
            "space": 7
        }
    ]
  }
```


### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/guide-categories/`

### Model Fields

Same as the fields used in creation with the addition of the following read-only fields

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | An unique identifier for your `GuideCategory`.


## Retrieving a `GuideCategory`
In the following examples, we will assume that the id of the `GuideCategory` we'd like to modify is 71.
To retrieve an individual `GuideCategory` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/guide-categories/71/`

## Updating a `GuideCategory`

To modify an existing `GuideCategory` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1/guide-categories/71/`

You will only need to include the specific fields you are updating and not a full request body.

## Deleting a `GuideCategory`

To delete a particular `GuideCategory`, issue a `DELETE` request to the url that points to the specific `GuideCategory` you'd like deleted:

`DELETE https://builder.guidebook.com/open-api/v1/guide-categories/71/`
