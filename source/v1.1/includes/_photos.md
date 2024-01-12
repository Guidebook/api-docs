# Photos

The `Photo` resource is a way to create a photo that can be viewed and shared within an `Album`. To create an `Album` for a `Photo`, see the section on [Albums](#albums). 

## Creating a `Photo`


```python
import requests

photo_url =  'https://builder.guidebook.com/open-api/v1.1/photos/'
api_key = 'API_KEY'

post_data =
{
    "album": 5,
    "caption": "My Caption",
    "image": "photo"
}

with open('photo.png', 'rb') as photo:
	response = requests.post(photo_url, data=post_data, headers={'Authorization': 'JWT ' + api_key}).json()

```

> The above commands return JSON structured like this:

```json
{
    "id": 7,
    "album": 5,
    "caption": "My Caption",
    "image": "http://s3.amazonaws.com/media.guidebook.com/upload/1/albums/1/68e60d71-cbd3-493d-a167-a634f1506c74.jpg",
    "report_value": 0
}

```


This endpoint will create a `Photo` for your `Album`.

### HTTP Request

`POST https://builder.guidebook.com/open-api/v1.1/photos/`

### Model Fields

Parameter            | Required  | Type    | Description
---------            | --------  | ------- | -----------
album                | yes | integer  | The specific `Album` your `Photo` belongs to.  See section on [Guides](#albums) for more info.
image		 		 | yes | file  | Your image file. It must be a PNG or JPEG.
caption	 		 	 | no | string  | A caption to be displayed with your image. 

## Listing `Photos`


```python

photo_url =  'https://builder.guidebook.com/open-api/v1.1/photos/?guide=1'
api_key = 'API_KEY'

# This will return all `Photos` you have access to
response = requests.get(photo_url, headers={'Authorization': 'JWT ' + api_key})
```

> The above command returns JSON structured like this:

```json
{
    "count": 3,
    "next": null,
    "previous": null,
    "results": [
        {
            "id": 5,
            "album": 5,
            "caption": "A Caption",
            "image": "http://s3.amazonaws.com/media.guidebook.com/upload/1/albums/1/53dd401a-fe27-4e08-ad45-8d661bf6d9e0.png",
            "report_value": 0
        },
        {
            "id": 6,
            "album": 5,
            "caption": "Another Caption",
            "image": "http://s3.amazonaws.com/media.guidebook.com/upload/1/albums/1/78123f55-cf0e-4746-bd76-aa0ddcc29789.png",
            "report_value": 0
        },
        {
            "id": 7,
            "album": 5,
            "caption": "My Caption",
            "image": "http://s3.amazonaws.com/media.guidebook.com/upload/1/albums/1/68e60d71-cbd3-493d-a167-a634f1506c74.jpg",
            "report_value": 0
        }
    ]
}

```


This endpoint can also be used to read data on `Photos`.
The `guide` filter is required.

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1.1/photos/?guide=<guide_id>`

### Model Fields

Same as the fields used in creation with the addition of the following read-only fields.

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | A unique identifier for your `Photo`.
report_value	| integer | The number of times a `Photo` has been reported. 


### Filtering data by `Album` id

Including a query parameter `album` allows you to filter for all `Photos` related to an `Album` you have access to (`Album` 47 in this example):

`GET https://builder.guidebook.com/open-api/v1.1/photos/?album=47`


## Retrieving a `Photo`
In the following examples, we will assume that the id of the `Photo` we'd like to modify is 71.
To retrieve an individual `Photo` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1.1/photos/71/`

## Updating a `Photo`

To modify an existing `Photo` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1.1/photos/71/`

You will only need to include the specific fields you are updating and not a full request body. The `image` field is not updatable. 

## Deleting a `Photo`

To delete a particular `Photo`, issue a `DELETE` request to the url that points to the specific `Photo` you'd like deleted:

`DELETE https://builder.guidebook.com/open-api/v1.1/photos/71/`
