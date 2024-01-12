# Videos

`Sessions` can be associated with `Videos` that you add to your guide. To create a reference to a `Video`, see the section on [Links](#links). Videos are created by providing the link to the video. Only Youtube, Vimeo, and Twitch videos are supported.

## Creating a `Video`


```python
import requests

video_url =  'https://builder.guidebook.com/open-api/v1.1/videos/'
api_key = 'API_KEY'

post_data =
{
    "guide": 1,
    "url": "https://www.youtube.com/watch?v=1111"
}

response_1 = request.post(video_url, data=post_data, headers={'Authorization': 'JWT ' + api_key}).json()

```

> The above commands return JSON structured like this:

```json

{
    "platform": "Youtube",
    "start_time": null,
    "end_time": null,
    "banner_url": "https://i.ytimg.com/vi/ZS9dYbjC6i8/maxresdefault_live.jpg",
    "title": "My First Video",
    "video_id": "1111",
    "url": "https://www.youtube.com/watch?v=1111",
    "video_type": "ondemand",
    "thumbnail_url": "https://i.ytimg.com/vi/ZS9dYbjC6i8/sddefault_live.jpg",
    "id": 7,
    "duration": 60,
    "guide": 1
}

```


This endpoint will create a `Video` for your `Guide`. 


### HTTP Request

`POST https://builder.guidebook.com/open-api/v1.1/videos/`

### Model Fields

Parameter            | Required  | Type    | Description
---------            | --------  | ------- | -----------
guide                | yes | integer  | The specific `Guide` your `Video` belongs to.  See section on [Guides](#guides) for more info.
url 				 | yes | string  | URL of your `Video` on Youtube, Vimeo, or Twitch.


## Listing `Videos`


```python

video_url =  'https://builder.guidebook.com/open-api/v1.1/videos/'
api_key = 'API_KEY'

# This will return all `Videos` you have access to
response = requests.get(video_url, headers={'Authorization': 'JWT ' + api_key})
```

> The above command returns JSON structured like this:

```json
{
    "count": 2,
    "next": null,
    "previous": null,
    "results": [
        {
            "platform": "Youtube",
            "start_time": null,
            "end_time": null,
            "banner_url": "https://i.ytimg.com/vi/ZS9dYbjC6i8/maxresdefault_live.jpg",
            "title": "My First Video",
            "video_id": "1111",
            "url": "https://www.youtube.com/watch?v=1111",
            "video_type": "ondemand",
            "thumbnail_url": "https://i.ytimg.com/vi/ZS9dYbjC6i8/sddefault_live.jpg",
            "id": 7,
            "duration": 60,
            "guide": 1
        },
        {
            "platform": "Vimeo",
            "start_time": null,
            "end_time": null,
            "banner_url": "https://i.vimeocdn.com/video/45635537_1280x960.jpg?r=pad",
            "title": "My Second Video",
            "video_id": "2222",
            "url": "https://www.youtube.com/watch?v=2222",
            "video_type": "ondemand",
            "thumbnail_url": "https://i.vimeocdn.com/video/45635537_640x360.jpg?r=pad",
            "id": 8,
            "duration": 237,
            "guide": 1
        }
    ]
}

```


This endpoint can also be used to read data on `Videos`. A `Video` object has a lot more metadata than just the url and guide you set on creation. Most of this is determined by the
platform that hosts the video.

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1.1/videos/?guide=<guide_id>`

### Model Fields



Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | A unique identifier for your `Video`.
platform        | string   | The platform that your `Video` is hosted on. The options are `Youtube`, `Vimeo`, or `Twitch`.
video_id        | string   | The id of your `Video` on its hosting platform.
video_type		| string   | Indicates if the `Video` is `live` or `ondemand`.
title           | string   | The title of your `Video` on its hosting platform.
duration        | float    | The duration of your `Video` in seconds, if is is on demand.
start_time      | datetime | The scheduled start time of your `Video`, if it is live.
end_time        | datetime | The scheduled end time of your `Video`, if it is live.
thumbnail_url   | url      | The url for the thumbnail image of your `Video`.
banner_url      | url      | The url for the banner image of your `Video`.




### Filtering data by `Guide` id

Including a query parameter `guide` allows you to filter for all `Video` related to a `Guide` you have access to (`Guide` 47 in this example):

`GET https://builder.guidebook.com/open-api/v1.1/videos/?guide=47`


## Retrieving a `Video`
In the following examples, we will assume that the id of the `Video` we'd like to modify is 71.
To retrieve an individual `Video` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1.1/videos/71/`

## Updating a `Video`

To modify an existing `Video` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1.1/videos/71/`

You will only need to include the specific fields you are updating and not a full request body. The fields that are allowed to be updated include: `title`, `duration`, `start_time`, `end_time`, `thumbnail_url`, and `banner_url`.

## Refreshing `Video` Metadata

To request a video to be synced with the data on its respective platform, you may send a request to refresh a `Video's` metadata. This will automatically update any fields that have been changed on Youtube, Twitch, or Vimeo. To refresh the metadata of a `Video`, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1.1/videos/71/refresh-metadata/`

No fields are required for this request. This endpoint has a rate limit of 3 requests per hour.

## Deleting a `Video`

To delete a particular `Video`, issue a `DELETE` request to the url that points to the specific `Video` you'd like deleted:

`DELETE https://builder.guidebook.com/open-api/v1.1/videos/71/`
