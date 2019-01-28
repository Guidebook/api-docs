# MenuItems

A `MenuItem` is an object that controls how a feature appears on builder and the mobile app. A `MenuItem` points to a specific object within a guide, such as a custom list, map, or schedule. They are used to navigate to different parts of a guide.

## Creating a `MenuItem`

```python
import requests

menu_item_url = 'https://builder.guidebook.com/open-api/v1/menu-items/'
api_key = 'API_KEY'
post_data = !INCLUDE "json/menu_item_create_request.json"

response = request.post(menu_item_url, data=post_data, headers={'Authorization': 'JWT ' + api_key}).json()

```

> The above commands return JSON structured like this:

```json
{
    "guide": 7,
    "content_type": "custom_list.customlist",
    "enabled": true,
    "object_id": 13,
    "id": 256,
    "created_at": "2019-01-18T20:22:44.804038Z"
}

```

This endpoint will create a `MenuItem` for the object related to the `object_id` and `content_type` that you specify.

### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/menu-items/`

### Model Fields

Parameter            | Required  | Type    | Description
---------            | --------  | ------- | -----------
guide                | yes | integer  | The specific `Guide` your `MenuItem` belongs to.  See section on [Guides](#guides) for more info.
content_type  		 | yes | string   | The content type of the object you want a `MenuItem` for. The allowed content types are `custom_list.customlist`, `custom_list.customlistitem`, and `schedule.scheduletrack`.
object_id     		 | yes | integer  | The id number of the object you want a `MenuItem` for.
title     			 | no | string   | The title of the `MenuItem`. If not provided, a default is used. 
rank                 | no  | integer  | The order the `MenuItem` will appear in the `MenuItem` section. If not provided, a default is used.
enabled     		 | no | boolean  | The enabled status of the `MenuItem`. If not provided, this defaults to `True`.


## Listing `MenuItems`


```python
import requests

menu_item_url = 'https://builder.guidebook.com/open-api/v1/menu-items/'
api_key = 'API_KEY'

# This will return all `MenuItem` you have access to
response = request.post(menu_item_url, headers={'Authorization': 'JWT ' + api_key}).json()

```

> The above command returns JSON structured like this:

```json
{
	"count": 2,
	"next": null,
	"previous": null,
	"results": [
        {
            "id": 159,
            "guide": 7,
            "content_type": "custom_list.customlist",
            "created_at": "2019-01-18T16:55:35.769347+0000",
            "rank": 0,
            "name": "Custom List Menu Item",
            "enabled": true,
            "object_id": 13
        },
        {
            "id": 160,
            "guide": 7,
            "content_type": "schedule.scheduletrack",
            "created_at": "2019-01-18T16:55:43.840032+0000",
            "rank": 0,
            "name": "Schedule Track Menu Item",
            "enabled": true,
            "object_id": 22
        }
	]
}
```


This endpoint can also be used to read data on `MenuItems`.

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/menu-items/`

### Model Fields

Same as the fields used in creation with the addition of the following read-only fields:

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | A unique identifier for your `MenuItem`.
created_at      | datetime | Time when this `MenuItem` was created - UTC.


### Filtering Data by `Guide` id

Including a query parameter `guide` allows you to filter for all `MenuItem` related to a `Guide` you have access to (`Guide` 47 in this example):

`GET https://builder.guidebook.com/open-api/v1/menu-items/?guide=47`


## Retrieving a `MenuItem`
In the following examples, we will assume that the id of the `MenuItem` we'd like to modify is 71.
To retrieve an individual `MenuItem` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/menu-items/71/`


## Updating a `MenuItem`

To modify an existing `MenuItem` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1/menu-items/71/`

You will only need to include the specific fields you are updating and not a full request body. Only `name`, `rank`, `object_id`, and `enabled` are updatable after creation. 


## Deleting a `MenuItem`

`DELETE` requests are not supported for `MenuItem` objects. Instead, you can can issue a `PATCH` request to set the `enabled` status to `False`. This will hide the `MenuItem` from view. 

