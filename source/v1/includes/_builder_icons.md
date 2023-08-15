# BuilderIcons

A `BuilderIcon` is an object that allows you to create custom `MenuItem` icons from PNG images which can be shared across _all_ your Guides and/or Organizations.

## Creating a `BuilderIcon`

```python
import requests

builder_icon_url = 'https://builder.guidebook.com/open-api/v1/builder-icons/'
api_key = 'API_KEY'
post_data = 
{
  "file": "icon_image",
  "tags": "['tag one', 'tag two]",
  "org": 123
}
response = requests.post(builder_icon_url, data=post_data, headers={'Authorization': 'JWT ' + api_key}).json()

```

> The above commands return JSON structured like this:

```json
{
  "id": 293,
  "file": "https://mediacdn.guidebook.com/upload/builderfile/c1c88374-2133-12ee-a0z1-3d957ascee78/rEiJ5EG43j0ViHVuWsXSuckPD0tlYAeYAugL.png",
  "tags": ["tag one", "tag two"],
  "creator": 1784,
  "access_control": [
    {
      "object_id": 1784,
      "entity": "user"
    },
    {
      "object_id": 2343,
      "entity": "org"
    }
  ]
}

```

This endpoint will create a `BuilderIcon` for the PNG image `file` that you
specify.

### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/builder-icons/`

### Model Fields

Parameter            | Required  | Type    | Description
---------            | --------  | ------- | -----------
file | yes | file | Your icon image file. It must be PNG and be of size 180x180px, 180x150px, 150x150px, 120x100px, or 100x100px.
tags | no | array or stringified array | A list of strings used to identify & search icons.
org | no | `id` of the Organization you wish to share the `BuilderIcon` with.

## Listing `BuilderIcons`

```python
import requests

menu_item_url = 'https://builder.guidebook.com/open-api/v1/builder-icons/'
api_key = 'API_KEY'

# This will return all `BuilderIcons` you have access to
response = requests.get(menu_item_url, headers={'Authorization': 'JWT ' + api_key}).json()

```

> The above command returns JSON structured like this:

```json
{
  "count": 2,
  "next": null,
  "previous": null,
  "results": [
      {
          "id": 369,
          "file": "https://mediacdn.guidebook.com/upload/builderfile/315bac20-2a69-11ee-afe4-dbf38e2997f2/Sbpnmc2CD9B9Fe9nuOL4hZzfd0i9WOUtJ8co.png",
          "tags": [
              "tag one",
              "tag two"
          ],
          "creator": 1,
          "access_control": [
              {
                  "object_id": 1,
                  "entity": "user"
              }
          ]
      },
      {
          "id": 368,
          "file": "https://mediacdn.guidebook.com/upload/builderfile/10a0dc94-2a69-11ee-afe4-dbf38e2997f2/1TY9VtysL5gmFPKai8pFyFeXf9wPn5ONNWNV.png",
          "tags": [],
          "creator": 1,
          "access_control": [
              {
                  "object_id": 3,
                  "entity": "org"
              }
          ]
      }
  ]
}
```


### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/menu-items/`

### Model Fields

Same as the fields used in creation with the addition of the following read-only fields:

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | A unique identifier for your `BuilderIcon`.
created_at      | datetime | Time when this `BuilderIcon` was created - UTC.
creator         | integer  | `id` of the `Account` that created the `BuilderIcon`.
access_control  | array    | Array of access records specifying who has permissions to interact with the `BuilderIcon`.


### Filtering Data by `Guide` id and other fields

Including a query parameter `guide` allows you to filter for all `BuilderIcons`
related to a `Guide` you have access to (`Guide` 13 in the following example):

`GET https://builder.guidebook.com/open-api/v1/builder-icons/?guide=13`

By default, all `BuilderIcons` you have permissions to will be returned.

You are also able to filter by the fields `org` and `tags` if you want to fetch
a list of `BuilderIcons` fitting specific criteria. See examples below for how
to filter on these fields and combining multiple filters:

`GET https://builder.guidebook.com/open-api/v1/builder-icons/?org=2`

`GET https://builder.guidebook.com/open-api/v1/builder-icons/?guide=13&org=2`

`GET https://builder.guidebook.com/open-api/v1/builder-icons/?tags=cat,dog`

`GET https://builder.guidebook.com/open-api/v1/builder-icons/?guide=13&tags=cat,dog`

## Retrieving a `BuilderIcon`

In the following examples, we will assume that the id of the `BuilderIcon` we'd
like to modify is 42. To retrieve an individual `BuilderIcon` object issue a
`GET` request like:

`GET https://builder.guidebook.com/open-api/v1/builder-icons/42/`


## Retrieving available `BuilderIcon` tags

To view tags for available `BuilderIcons` issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/builder-icons/tags/`

By default, a list of tags for all `BuilderIcons` you have permissions to will be returned.

You are also able to filter tags by the fields `guide` and `org` if you want to
fetch a list of `BuilderIcon` tags fitting specific criteria. See examples
below for how to filter on these fields and combining multiple filters:

`GET https://builder.guidebook.com/open-api/v1/builder-icons/tags/?guide=23`

`GET https://builder.guidebook.com/open-api/v1/builder-icons/tags/org=4`

`GET https://builder.guidebook.com/open-api/v1/builder-icons/tags/?guide=23&org=4`


## Updating a `BuilderIcon`

To modify an existing `BuilderIcon` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1/builder-icons/71/`

You will only need to include the specific fields you are updating and not a
full request body. Only `file` and `tags` are updatable after creation.

## Deleting a `BuilderIcon`

To delete a particular `BuilderIcon`, issue a `DELETE` request to the url that
points to the specific `BuilderIcon` you'd like deleted:

`DELETE https://builder.guidebook.com/open-api/v1/builder-icons/82/`