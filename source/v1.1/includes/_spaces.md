# Spaces

A Space is a branded "container" for a customer's guides. A Space lives within a single custom MobileApp and/or one or more Guidebook flagship apps.

## Listing `Spaces`

```python
import requests

spaces_url = 'https://builder.guidebook.com/open-api/v1.1/spaces/'
api_key = 'API_KEY'
response = requests.get(spaces_url, headers={'Authorization': 'JWT ' + api_key}).json()
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
            "name": "My Space",
            "description": "For all my conferences",
            "owner": 413
        },
        {
            "id": 2,
            "name": "My Other Space",
            "description": "For all my other conferences",
            "owner": 413
        }
    ]
}
```

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1.1/spaces/`

### Space Properties

Property           | Type        | Description
---------          | --------    | --------
id                 | int         | id of the `Space` object.
name               | str         | Name of the `Space`.
description        | str         | A description of the `Space`.
owner              | int         | id of the `Account` User or Organization that owns the `Space` object.


### Filtering `Space` by `owner` id.

Including a query parameter `owner` allows you to filter for all `Spaces` owned by a specific Account (`Account` 47 in this example):

`GET https://builder.guidebook.com/open-api/v1.1/spaces/?owner=47`
