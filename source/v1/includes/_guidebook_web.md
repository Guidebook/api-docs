# Guidebook Web

Guidebook Web is the website representation of your guide, and its settings can be controlled by the Guidebook Web `Metadata` resource.

## Listing Guidebook Web `Metadata` objects

This endpoint will list all Guidebook Web `Metadata` objects that are owned by your Account. Typically, this endpoint is called with a `guide_id` filter such that it returns the Guidebook Web `Metadata` object associated to a lone `Guide` object that is owned by you.

```python
import requests

guidebook_web_metadata_url = 'https://builder.guidebook.com/open-api/v1/guidebook-web-metadata/'
api_key = 'API_KEY'

# This will return all Guidebook Web metadata objects you have access to
response = request.get(guidebook_web_metadata_url, headers={'Authorization': 'JWT' + api_key})
```

> The above command returns JSON structured like this:

```json
{
    "count": 4,
    "next": null,
    "previous": null,
    "results": [
        {
            "id": 1,
            "created_at": "2017-09-27T07:31:48.637192+0000",
            "guide": 1,
            "space": null,
            "enabled": true
        }
	]
}
```

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/guidebook-web-metadata/`

### Model Fields

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | An unique identifier for your Guidebook Web `Metadata` object.
created_at      | datetime | Time when this Guidebook Web `Metadata` object was created - UTC.
guide           | integer  | The specific `Guide` your Guidebook Web `Metadata` object belongs to.
space           | integer  | The specific `Space` your Guidebook Web `Metadata` object belongs to.
enabled         | boolean  | Whether the specific `Guides` Guidebook Web page is accessible.

### Filtering by `Guide` id

Including a query parameter `guide` allows you to filter for the Guidebook Web `Metadata` object related to a `Guide` you have access to (`Guide` 47 in the following example)

`GET https://builder.guidebook.com/open-api/v1/guidebook-web-metadata/?guide=47`

## Retrieving a Guidebook Web `Metadata` object

In the following examples, we will assume that the id of the Guidebook Web `Metadata` object we'd like to modify is 71. To retrieve an individual Guidebook Web `Metadata` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/guidebook-web-metadata/71/`

## Updating a Guidebook Web `Metadata` object

To modify an existing Guidebook Web `Metadata` object, issue a `PATCH` request
like:

`PATCH https://builder.guidebook.com/open-api/v1/guidebook-web-metadata/71/`

You will only need to include the specific fields you are updating and not a
full request body. The following fields are updatable:

Parameter       | Type    | Description
---------       | ------- | -----------
enabled         | boolean | Whether the specific `Guides` Guidebook Web page is accessible.
