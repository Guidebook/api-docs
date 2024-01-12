# WebViews

You can create a `WebView` in your guide that displays an html page or external url. To view your `WebView` in a guide, you must either create a [MenuItem](#menuitems) for it, or reference it in a [Link](#links).

## Creating a `WebView`


```python
import requests

webview_url =  'https://builder.guidebook.com/open-api/v1.1/webviews/'
api_key = 'API_KEY'

# Example with webview url
post_data =
{
    "webview_type": "url",
    "guide": 1,
    "url": "http://www.google.com",
    "name": "My Other Webview"
}

response_1 = request.post(webview_url, data=post_data, headers={'Authorization': 'JWT ' + api_key}).json()

# Example with webview html file
post_data =
{
    "webview_type": "html",
    "guide": 1,
    "html_file": "html_file",
    "name": "My Webview"
}

with open('your_file.html', 'rb') as html_file:
	response_2 = request.post(webview_url, data=post_data, headers={'Authorization': 'JWT ' + api_key}).json()

```

> The above commands return JSON structured like this:

```json
# Example with webview url
{
    "id": 7,
    "webview_type": "url",
    "guide": 1,
    "url": "http://www.google.com",
    "html_file": null,
    "name": "My Other Webview"
}

# Example with webview html file
{
    "id": 8,
    "webview_type": "html",
    "guide": 1,
    "url": null,
    "html_file": "http://s3.amazonaws.com/media.guidebook.com/upload/1/xB9v4xZMKeFpXfQsCe6LAVLkJS8WJ3UKlOcf.html",
    "name": "My Webview"
}

```


This endpoint will create a `WebView` for your `Guide`.

### HTTP Request

`POST https://builder.guidebook.com/open-api/v1.1/webviews/`

### Model Fields

Parameter            | Required  | Type    | Description
---------            | --------  | ------- | -----------
name 				 | no | string | The name for your `Webview` object.
guide                | yes | integer  | The specific `Guide` your `WebView` belongs to.  See section on [Guides](#guides) for more info.
webview_type		 | yes | string  | This field is used to indicate the type of `WebView` you want to create. The options are `url` and `html`.
url 				 | no | string  | URL for your `WebView`, if `webview_type` is set to URL.
html_file 			 | no | file  | HTML file for your `WebView`, if `webview_type` is set to html. The maximum file name is 90 characters long, including the file extension.


## Listing `WebViews`


```python
import requests

webview_url =  'https://builder.guidebook.com/open-api/v1.1/webviews/?guide=1'
api_key = 'API_KEY'

# This will return all `WebViews` you have access to
response = requests.get(webview_url, headers={'Authorization': 'JWT ' + api_key})
```

> The above command returns JSON structured like this:

```json
{
    "count": 2,
    "next": null,
    "previous": null,
    "results": [
        {
            "id": 7,
            "webview_type": "url",
            "guide": 1,
            "url": "https://www.google.com",
            "html_file": null,
            "name": "My Other Webview"
        },
        {
            "id": 8,
            "webview_type": "html",
            "guide": 1,
            "url": null,
            "html_file": "http://s3.amazonaws.com/media.guidebook.com/upload/1/xB9v4xZMKeFpXfQsCe6LAVLkJS8WJ3UKlOcf.html",
            "name": "My Webview"
        }
    ]
}

```


This endpoint can also be used to read data on `WebViews`.
The `guide` filter is required'

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1.1/webviews/?guide=<guide_id>`

### Model Fields

Same as the fields used in creation with the addition of the following read-only field.

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | A unique identifier for your `WebView`.


### Filtering data by `Guide` id

Including a query parameter `guide` allows you to filter for all `WebViews` related to a `Guide` you have access to (`Guide` 47 in this example):

`GET https://builder.guidebook.com/open-api/v1.1/webviews/?guide=47`


## Retrieving a `WebView`
In the following examples, we will assume that the id of the `WebView` we'd like to modify is 71.
To retrieve an individual `WebView` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1.1/webviews/71/`

## Updating a `WebView`

To modify an existing `WebView` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1.1/webviews/71/`

You will only need to include the specific fields you are updating and not a full request body.

## Deleting a `WebView`

To delete a particular `WebView`, issue a `DELETE` request to the url that points to the specific `WebView` you'd like deleted:

`DELETE https://builder.guidebook.com/open-api/v1.1/webviews/71/`
