# PDFs

Some resources (like `Sessions` and `CustomListItems`) can be associated with `PDFs` that you upload to your guide. To create a reference to a `PDF`, see the section on [Links](#links). A `PDF` name is derived from the `Link` `_title` field, and if not provided, will default to the name on the pdf file. 

## Creating a `PDF`


```python
import requests

pdf_url =  'https://builder.guidebook.com/open-api/v1.1/pdf/'
api_key = 'API_KEY'
# Example with pdf url
post_data =
{
    "pdf_view_type": "url",
    "guide": 1,
    "url": "http://dropbox.com/mypdf.pdf",
    "include": false
}

response_1 = request.post(pdf_url, data=post_data, headers={'Authorization': 'JWT ' + api_key}).json()

# Example with pdf file
post_data =
{
    "pdf_view_type": "pdf",
    "guide": 1,
    "pdf_file": "pdf_file",
    "include": true
}

with open('your_pdf.pdf', 'rb') as pdf_file:
	response_2 = request.post(pdf_url, data=post_data, headers={'Authorization': 'JWT ' + api_key}).json()

```

> The above commands return JSON structured like this:

```json
# Example with pdf url
{
    "id": 7,
    "pdf_view_type": "url",
    "guide": 1,
    "url": "http://dropbox.com/mypdf.pdf",
    "pdf_file": null,
    "last_updated": "2018-06-27T15:30:11.015128+0000"
}

# Example with pdf file
{
    "id": 8,
    "pdf_view_type": "pdf",
    "guide": 1,
    "url": null,
    "pdf_file": "http://s3.amazonaws.com/media.guidebook.com/upload/1/ZzpZyJOHxr8hkTAz9yC7h7zz5BWQ2URwjbtW.pdf",
    "last_updated": "2018-06-27T15:30:11.015128+0000"
}

```


This endpoint will create a `PDF` for your `Guide`.

### HTTP Request

`POST https://builder.guidebook.com/open-api/v1.1/pdfs/`

### Model Fields

Parameter            | Required  | Type    | Description
---------            | --------  | ------- | -----------
guide                | yes | integer  | The specific `Guide` your `PDF` belongs to.  See section on [Guides](#guides) for more info.
pdf_view_type		 | yes | string  | This field is used to indicate the format of your input file. The options are `url` and `pdf`.
url 				 | no | string  | URL of your `PDF`, if `pdf_view_type` is set to URL.
pdf_file 			 | no | file  | Your pdf file, if `pdf_view_type` is set to PDF.
include 			 | no | boolean  | Indicates if the file should be included in the initial guide download. Default is `False`. For best results, please limit the total number of documents included in the initial download to 20 MB.

## Listing `PDFs`


```python

pdf_url =  'https://builder.guidebook.com/open-api/v1.1/pdfs/?guide=1'
api_key = 'API_KEY'

# This will return all `PDFs` you have access to
response = requests.get(pdf_url, headers={'Authorization': 'JWT ' + api_key})
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
            "pdf_view_type": "url",
            "guide": 1,
            "url": "http://dropbox.com/mypdf.pdf",
            "pdf_file": null,
            "last_updated": "2018-06-27T15:30:11.015128+0000"
        },
        {
            "id": 8,
            "pdf_view_type": "pdf",
            "guide": 1,
            "url": null,
            "pdf_file": "http://s3.amazonaws.com/media.guidebook.com/upload/1/0Ezkq41pl591ayQEQTETToV2ml5mhTQn3V5l.pdf",
            "last_updated": "2018-06-27T15:30:11.015128+0000"
        }
    ]
}

```


This endpoint can also be used to read data on `PDFs`.
The `guide` filter is required.

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1.1/pdfs/?guide=<guide_id>`

### Model Fields

Same as the fields used in creation with the addition of the following read-only field.

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | A unique identifier for your `PDF`.
last_updated    | datetime	| Time when this `PDF` was last updated - UTC.


### Filtering data by `Guide` id

Including a query parameter `guide` allows you to filter for all `PDF` related to a `Guide` you have access to (`Guide` 47 in this example):

`GET https://builder.guidebook.com/open-api/v1.1/pdfs/?guide=47`


## Retrieving a `PDF`
In the following examples, we will assume that the id of the `PDF` we'd like to modify is 71.
To retrieve an individual `PDF` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1.1/pdfs/71/`

## Updating a `PDF`

To modify an existing `PDF` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1.1/pdfs/71/`

You will only need to include the specific fields you are updating and not a full request body.

## Deleting a `PDF`

To delete a particular `PDF`, issue a `DELETE` request to the url that points to the specific `PDF` you'd like deleted:

`DELETE https://builder.guidebook.com/open-api/v1.1/pdfs/71/`
