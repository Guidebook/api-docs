# Sponsors

The `Sponsors` resource is a way to create a banner ad in your guide. Banner ads appear at the bottom of the navigation menu.

## Creating a `Sponsor`


```python
import requests

sponsor_url =  'https://builder.guidebook.com/open-api/v1/sponsors/'
api_key = 'API_KEY'

post_data =
{
    "guide": 5,
    "banner_url": "https://guidebook.com/",
    "name": "MySponsor",
    "banner_image": "banner_image",
    "website_only": true
}
with open('banner.png', 'rb') as banner_image:
	response = request.post(sponsor_url, data=post_data, headers={'Authorization': 'JWT ' + api_key}).json()

```

> The above commands return JSON structured like this:

```json
{
    "id": 15,
    "guide": 5,
    "banner_url": "https://guidebook.com/",
    "name": "MySponsor",
    "duration": 5,
    "banner_image": "http://s3.amazonaws.com/media.guidebook.com/upload/5/6FTfnJ2M7YqbA0bX7aDiAIKXTGydE58Rdk66.png",
    "enabled": false,
    "banner_url_text": null,
    "website_only": true,
    "description_html": null
}
```


This endpoint will create a `Sponsor` for your `Guide`.

### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/sponsors/`

### Model Fields

Parameter            | Required  | Type    | Description
---------            | --------  | ------- | -----------
guide                | yes | integer  | The specific `Guide` your `Sponsor` belongs to.  See section on [Guides](#guides) for more info.
name 				 | yes | string  | Name of the `Sponsor`.
banner_image		 | yes | file  | Your image file. It must be a PNG of size 600x110 pixels.
website_only		 | no | boolean | Indicates if a banner should launch directly to the `banner_url`, or to the `description_html`. The default is `False`, meaning that when a user taps on the banner in their device, they will be launched to `banner_url_text`.
banner_url	 		 | sometimes | string  | The url that your banner_image should direct to when clicked on. This is required if `website_only` is `True`.
banner_url_text 	 | sometimes | string  | A sponsor description that is displayed instead of directing the user to the `banner_url`. This is required if `website_only` is `False`.
description_html	 | no | string | Optional html field to describe your Sponsor. Only rendered if `website_only` is `False`. This field supports basic HTML.  See section on [html text](#html-text).
duration			 | no | integer | The number of seconds that a banner is displayed for. Options are 5, 10, 20, and 30 seonds. If not provided, it defaults to 5 seconds.
enabled				 | no | boolean | Indicates if the `Sponsor` banner should show up in the guide. The default is `True`.

## Listing `Sponsors`


```python
import requests

sponsor_url =  'https://builder.guidebook.com/open-api/v1/sponsors/'
api_key = 'API_KEY'

# This will return all `Sponsors` you have access to
response = request.get(sponsor_url, headers={'Authorization': 'JWT ' + api_key})
```

> The above command returns JSON structured like this:

```json
{
    "count": 2,
    "next": null,
    "previous": null,
    "results": [
        {
            "id": 14,
            "guide": 7,
            "banner_url": "https://www.google.com/",
            "name": "A Sponsor",
            "duration": 10,
            "banner_image": "http://s3.amazonaws.com/media.guidebook.com/upload/7/AHbKlnQeA4PPbV7MFxwRlOa8sPkzyMyaHorZ.png",
            "enabled": true,
            "banner_url_text": "Sponsor Description",
            "website_only": false,
            "description_html": null
        },
        {
            "id": 15,
            "guide": 5,
            "banner_url": "https://guidebook.com/",
            "name": "MySponsor",
            "duration": 5,
            "banner_image": "http://s3.amazonaws.com/media.guidebook.com/upload/5/6FTfnJ2M7YqbA0bX7aDiAIKXTGydE58Rdk66.png",
            "enabled": false,
            "banner_url_text": null,
            "website_only": true,
            "description_html": null
        }
    ]
}
```


This endpoint can also be used to read data on `Sponsors`.

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/sponsors/`

### Model Fields

Same as the fields used in creation with the addition of the following read-only field.

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | A unique identifier for your `Sponsor`.


### Filtering data by `Guide` id

Including a query parameter `guide` allows you to filter for all `Sponsors` related to a `Guide` you have access to (`Guide` 47 in this example):

`GET https://builder.guidebook.com/open-api/v1/sponsors/?guide=47`


## Retrieving a `Sponsor`
In the following examples, we will assume that the id of the `Sponsor` we'd like to modify is 71.
To retrieve an individual `Sponsor` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/sponsors/71/`

## Updating a `Sponsor`

To modify an existing `Sponsor` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1/sponsors/71/`

You will only need to include the specific fields you are updating and not a full request body.

## Deleting a `Sponsor`

To delete a particular `Sponsor`, issue a `DELETE` request to the url that points to the specific `Sponsor` you'd like deleted:

`DELETE https://builder.guidebook.com/open-api/v1/sponsors/71/`