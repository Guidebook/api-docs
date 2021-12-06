# SpaceGuideAssociations

A SpaceGuideAssociation is used to represent the relationship between a guide and a Space. A guide will only be searchable in a given space if there is a SpaceGuideAssociation that links the two together.

## Creating a `SpaceGuideAssociation`

```python
import requests

sga_url = 'https://builder.guidebook.com/open-api/v1/space-guide-associations/'
api_key = 'API_KEY'
post_data =
{
    "guide": 1,
    "space": 1
}
response = requests.post(sga_url, headers={'Authorization': 'JWT ' + api_key}).json()
```

> The above commands return JSON structured like this:

```json
{
    "id": 1,
    "guide": 1,
    "space": 1
}
```

This endpoint will create a `SpaceGuideAssociation` between the specified `Guide` and `Space`.

### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/space-guide-associations/`

### SpaceGuideAssociation Properties

Property           | Type        | Description
---------          | --------    | --------
id                 | int         | id of the `SpaceGuideAssociation` object.
guide              | int         | id of the related `Guide` object.
space              | int         | id of the related `Space` object.

## Listing `SpaceGuideAssociations`

```python
import requests

sga_url = 'https://builder.guidebook.com/open-api/v1/space-guide-associations/'
api_key = 'API_KEY'
response = requests.get(sga_url, headers={'Authorization': 'JWT ' + api_key}).json()
```

> The above command returns JSON structured like this:

```json
{
  "count": 2,
  "next": null,
  "previous": null,
  "results": [
    {
      "id": 1,
      "guide": 1,
      "space": 1
    },
    {
      "id": 2,
      "guide": 1,
      "space": 2
    }
  ]
}
```

This endpoint can also be used to read data on `SpaceGuideAssociations`.

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/space-guide-associations/`

### Model Fields

Same as the fields listed in the "SpaceGuideAssociation Properties" section above.

## Deleting a `SpaceGuideAssociation`

```python
import requests

sga_url = 'https://builder.guidebook.com/open-api/v1/space-guide-associations/delete-by-space-guide-pair/?guide=<id>&space=<id>'
api_key = 'API_KEY'

response = requests.delete(sga_url, headers={'Authorization': 'JWT ' + api_key}).json()
```

This endpoint will delete the `SpaceGuideAssociation` that is associated with the specified `Guide` and `Space`.

### HTTP Request

`DELETE https://builder.guidebook.com/open-api/v1/space-guide-associations/delete-by-space-guide-pair/?guide=1&space=1`

A successful request to this endpoint will return a status code of `204 NO CONTENT`

