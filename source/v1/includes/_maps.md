# Maps

The `Maps` resource is a static map image that can be added to your guide. Example `Map` uses include campus maps, internal floor plans, and/or booth layouts for an exhibit hall or poster session. 

## Creating a `Map`


```python
import requests

map_url =  'https://builder.guidebook.com/open-api/v1/maps/'
api_key = 'API_KEY'

post_data =
{
    "guide": 1,
    "image": "map_image",
    "name": "MyMap",
    "description": "Event Map"
}
with open('your_map.jpg', 'rb') as map_image:
	response = requests.post(map_url, data=post_data, headers={'Authorization': 'JWT ' + api_key}).json()

```

> The above commands return JSON structured like this:

```json
{
    "guide": 1,
    "image": "http://s3.amazonaws.com/media.guidebook.com/upload/1/fsJcNBuRlw0MtNcIoC6MFBLicp43bp1q3L1y.jpg",
    "name": "MyMap",
    "description": "Event Map",
    "id": 7,
    "rank": 0.0
}
```


This endpoint will create a `Map` for your `Guide`.

### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/maps/`

### Model Fields

Parameter            | Required  | Type    | Description
---------            | --------  | ------- | -----------
guide                | yes | integer  | The specific `Guide` your `Map` belongs to.  See section on [Guides](#guides) for more info.
image		 		 | yes | file  | Your image file. It must be either JPG or PNG, and between 1000x1000 and 2000x2000 pixels.
name 				 | yes | string  | Name of the `Map`.
description 		 | no | string  | Description that will be displayed in the app.
rank 			 	 | no | float  | The order the `Map` will appear.


## Listing `Maps`


```python
import requests

map_url =  'https://builder.guidebook.com/open-api/v1/maps/'
api_key = 'API_KEY'

# This will return all `Maps` you have access to
response = requests.get(map_url, headers={'Authorization': 'JWT ' + api_key})
```

> The above command returns JSON structured like this:

```json
{
    "count": 2,
    "next": null,
    "previous": null,
    "results": [
        {
            "id": 6,
            "guide": 1,
            "image": "http://s3.amazonaws.com/media.guidebook.com/upload/1/WH2CMLWJhbizmXD83qEm0GsiclZejP3QqNlf.png",
            "name": "AMap",
            "description": null,
            "rank": 0.0
        },
        {
            "id": 7,
            "guide": 1,
            "image": "http://s3.amazonaws.com/media.guidebook.com/upload/1/fsJcNBuRlw0MtNcIoC6MFBLicp43bp1q3L1y.jpg",
            "name": "MyMap",
            "description": "Event Map",
            "rank": 0.0
        }
    ]
}
```


This endpoint can also be used to read data on `Maps`.

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/maps/`

### Model Fields

Same as the fields used in creation with the addition of the following read-only field.

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | A unique identifier for your `Map`.

### Filtering data by `Guide` id

Including a query parameter `guide` allows you to filter for all `Maps` related to a `Guide` you have access to (`Guide` 47 in this example):

`GET https://builder.guidebook.com/open-api/v1/maps/?guide=47`


## Retrieving a `Map`
In the following examples, we will assume that the id of the `Map` we'd like to modify is 71.
To retrieve an individual `Map` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/maps/71/`

## Updating a `Map`

To modify an existing `Map` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1/maps/71/`

You will only need to include the specific fields you are updating and not a full request body.

## Deleting a `Map`

To delete a particular `Map`, issue a `DELETE` request to the url that points to the specific `Map` you'd like deleted:

`DELETE https://builder.guidebook.com/open-api/v1/maps/71/`
