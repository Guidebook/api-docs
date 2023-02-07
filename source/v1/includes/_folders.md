# Folders

A `Folder` is a container for `MenuItems` in your `Guide`. To view your `Folder` in your `Guide`, you must create a [MenuItem] (#menuitems) for it. To add `MenuItems` to your `Folder`, you must update the `folder` field on the `MenuItem` object. 

## Creating a `Folder`


```python
import requests

folder_url =  'https://builder.guidebook.com/open-api/v1/folders/'
api_key = 'API_KEY'

post_data =
{
    "guide": 7
}
response_1 = request.post(folder_url, data=post_data, headers={'Authorization': 'JWT ' + api_key}).json()
```

> The above commands return JSON structured like this:

```json
{
    "id": 1,
    "guide": 7,
    "menuitems": []
}
```


This endpoint will create a `Folder` for your `Guide`.

### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/folders/`

### Model Fields

Parameter            | Required  | Type    | Description
---------            | --------  | ------- | -----------
guide                | yes | integer  | The specific `Guide` your `Folder` belongs to.  See section on [Guides](#guides) for more info.


## Listing `Folders`


```python
import requests

folder_url =  'https://builder.guidebook.com/open-api/v1/folders/'
api_key = 'API_KEY'

# This will return all `Folders` you have access to
response = requests.get(folder_url, headers={'Authorization': 'JWT ' + api_key})
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
            "guide": 7,
            "menuitems": [
                18
            ]
        },
        {
            "id": 2,
            "guide": 7,
            "menuitems": []
        },
        {
            "id": 3,
            "guide": 7,
            "menuitems": [
                20,
                7,
                2
            ]
        }
    ]
}
```


This endpoint can also be used to read data on `Folders`.

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/folders/`

### Model Fields

Same as the fields used in creation with the addition of the following read-only fields.

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | A unique identifier for your `Folder`.
menuitems       | array of integers | A list of ids of `MenuItems` in the `Folder`


### Filtering data by `Guide` id

Including a query parameter `guide` allows you to filter for all `Folders` related to a `Guide` you have access to (`Guide` 47 in this example):

`GET https://builder.guidebook.com/open-api/v1/folders/?guide=47`


## Retrieving a `Folder`
In the following examples, we will assume that the id of the `Folders` we'd like to modify is 71.
To retrieve an individual `Folder` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/folders/71/`

## Updating a `Folder`

The `Folder` object does not have any updatable fields. To add a `MenuItem` to a `Folder`, see the section on [MenuItems] (#menuitems)

## Deleting a `Folder`

To delete a particular `Folder`, issue a `DELETE` request to the url that points to the specific `Folder` you'd like deleted:

`DELETE https://builder.guidebook.com/open-api/v1/folders/71/`

This will not delete the `MenuItems` inside the folder, only the `Folder` itself. Any `MenuItems` that were in the `Folder` will appear on the home screen. Note that their ranks will remain unchanged from being in the `Folder`, so they may need to be updated to be in the correct order.
