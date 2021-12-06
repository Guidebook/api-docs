# CustomListItemRelations

The `CustomListItemRelation` resource is the "through" object that links a `CustomListItem` to a `CustomList`. For example, to add a `CustomListItem` named "Peter Lada" to a `CustomList` named "Programmer Conference 2017 Speakers", a new `CustomListItemRelation` object would be created with the id of the "Peter Lada" `CustomListItem` and the id of the "Programmer Conference 2017 Speakers" `CustomList`. When more than one `CustomListItem` exists inside of a `CustomList`, display order can be controlled by the `rank` field on `CustomListItemRelation`.

## Creating CustomListItemRelations


```python
import requests

url = 'https://builder.guidebook.com/open-api/v1/custom-list-item-relations/'
api_key = 'API_KEY'
post_data =
{
  "custom_list": 59,
  "custom_list_item": 369,
  "rank": 15.1
}
response = requests.post(url, data=post_data, headers={'Authorization': 'JWT ' + api_key}).json()
```

> The above command returns JSON structured like this:

```json
{
  "id": 156,
  "custom_list": 59,
  "custom_list_item": 369,
  "rank": 15.1,
  "created_at": "2017-09-22T20:18:38.174876+0000"
}
```

### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/custom-list-item-relations/`

Note that if you do not include a `rank` value in your `POST` data, `rank` defaults to to a large negative value that decreases with time.

### Model Fields

Property          | Required    | Type        | Description
---------         | --------    | --------    | --------
custom_list_item  | yes         | integer     | id of the `CustomListItem` being associated to the `CustomList` identified by `custom_list`.
custom_list       | yes         | integer     | id of the `CustomList` that `custom_list_item` is being associated to. Note that a given `(custom_list_item, custom_list)` tuple cannot be repeated on different `CustomListItemRelation` objects ("you can only associate a given `CustomListItem` to a given `CustomList`" once").
rank              | no          | float       | Controls the display order of `CustomListItems` within a `CustomList` - `CustomListItems` are displayed in ascending order by rank. Note that a given `(custom_list, rank)` tuple cannot be repeated on different `CustomLIstItemRelation` objects ("`rank` is unique amongst all the `CustomListItemRelations` associated to a given `CustomList`").


## Listing CustomListItemRelations


```python
import requests

url = 'https://builder.guidebook.com/open-api/v1/custom-list-item-relations/'
api_key = 'API_KEY'
response = requests.get(guides_url, headers={'Authorization': 'JWT ' + api_key}).json()
```

> The above command returns JSON structured like this:

```json
{
  "count": 3,
  "next": null,
  "previous": null,
  "results": [
    {
      "id": 1,
      "custom_list": 1,
      "custom_list_item": 1,
      "rank": 3.25,
      "created_at": "2017-08-31T20:18:38.174876+0000"
    },
    {
      "id": 5,
      "custom_list": 1,
      "custom_list_item": 5,
      "rank": 3.3,
      "created_at": "2017-08-31T20:19:33.342154+0000"
    },
    {
      "id": 6,
      "custom_list": 1,
      "custom_list_item": 6,
      "rank": 4.1,
      "created_at": "2017-08-31T20:19:45.994749+0000"
    }
  ]
}
```


### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/custom-list-item-relations/`

### Model Fields

Same as the fields used in creation with the addition of the following read-only fields:

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | An unique identifier for your `CustomListItemRelation`.
created_at      | datetime | Time when this `CustomListItemRelation` was created - UTC.

### Filtering CustomListItemRelations

To filter the returned `CustomListItemRelations` by the related `CustomListItem` you can include the query parameter `custom_list_item`. The following request, for examples, filters for `CustomListItemRelations` related to `custom_list_item` 5.

`GET https://builder.guidebook.com/open-api/v1/custom-list-item-relations/?custom_list_item=5`

To filter the returned `CustomListItemRelations` by the related `CustomList` you can include the query parameter `custom_list`. The following request, for examples, filters for `CustomListItemRelations` related to `custom_list` 1.

`GET https://builder.guidebook.com/open-api/v1/custom-list-item-relations/?custom_list=1`

You can combine the above two filters to do something like, "find the `CustomListItemRelation` that associates `custom_list_item` 5 with `custom_list` 1:"

`GET https://builder.guidebook.com/open-api/v1/custom-list-item-relations/?custom_list_item=5&custom_list=1`

## Manipulating Individual CustomListItemRelations


> Update the rank of a CustomListItemRelation

```python
import requests

url = 'https://builder.guidebook.com/open-api/v1/custom-list-item-relations/156/'
api_key = 'API_KEY'
patch_data =
{
  "rank": 46.3
}
response = requests.patch(url, data=patch_data, headers={'Authorization': 'JWT ' + api_key}).json()
```

> PATCH requests (to update) and GET requests (to retrieve) an individual CustomListItemRelation will return a JSON structure like this:

```json
{
  "id": 156,
  "custom_list": 59,
  "custom_list_item": 369,
  "rank": 46.3,
  "created_at": "2017-09-22T20:18:38.174876+0000"
}
```


To access and manipulate an individual `CustomListItemRelation` object, use a url that ends with the id of a `CustomListItemRelation` object:

`https://builder.guidebook.com/open-api/v1/custom-list-item-relations/<custom_list_item_relation_id>/`

## Retrieving a `CustomListItemRelation`

In the following examples, we will assume that the id of the `CustomListItemRelation` we'd like to modify is 156.  To retrieve an individual `CustomListItemRelation` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/custom-list-item-relations/156/`

## Updating a `CustomListItemRelation`

The only field that can be updated on `CustomListItemRelation` is `rank`. Attempts to modify, for example, the `custom_list` or `custom_list_item` fields on a `CustomListItemRelation` object will be ignored. To update the `rank` of a  `CustomListItemRelation`, issue a `PATCH` request where the request body includes the new `rank` you'd like the `CustomListItemRelation` to have.

`PATCH https://builder.guidebook.com/open-api/v1/custom-list-item-relations/156/`

## Deleting a `CustomListItemRelation`

To delete a particular `CustomListItemRelation`, issue a `DELETE` request to the url that points to the specific `CustomListItemRelation` you'd like deleted:

`DELETE https://builder.guidebook.com/open-api/v1/custom-list-item-relations/156/`
