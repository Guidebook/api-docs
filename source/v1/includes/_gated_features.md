# Gated Features

The `GatedFeature` resource is responsible for limiting access to certain features in your `Guide`.

## Creating `GatedFeatures`


```python
import requests

gated_feature_url =  'https://builder.guidebook.com/open-api/v1/gated-feature/'
api_key = 'API_KEY'
post_data =
{
	"object_id": 2,
	"guide": 7,
	"content_type": "custom_list.customlist",
	"attendees": [],
	"groups": []
}
response = requests.post(gated_feature_url, data=post_data, headers={'Authorization': 'JWT ' + api_key}).json()


```

> The above commands return JSON structured like this:

```json
{
    "id": 1,
    "guide": 7,
    "content_type": "custom_list.customlist",
    "object_id": 2,
    "attendees": [],
    "groups": []
}

```


This endpoint will create a `GatedFeature` for your `Guide`.

### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/gated-features/`

### Model Fields

Parameter            | Required  | Type    | Description
---------            | --------  | ------- | -----------
guide                | yes | integer  | The specific `Guide` your `GatedFeature` belongs to.  See section on [Guides](#guides) for more info.
content_type         | yes | string   | The content type of the target object to gate.  The options are: "custom_list.customlist"
object_id            | yes | integer  | The id number of the target object to gate.  Not updatable after creation.
attendees     		 | no | list   | The list of attendees that should be able to access the gated object.
groups   		     | no | list   | The list of groups that should be able to access the gated object.


## Listing `GatedFeatures`


```python
import requests

gated_feature_url =  'https://builder.guidebook.com/open-api/v1/gated_features/'
api_key = 'API_KEY'

# This will return all `GatedFeatures` you have access to
response = requests.get(gated_feature_url, headers={'Authorization': 'JWT ' + api_key})
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
            "content_type": "custom_list.customlist",
            "object_id": 2,
            "attendees": [
                5
            ],
            "groups": [
                10
            ]
        },
		{
            "id": 2,
            "guide": 7,
            "content_type": "custom_list.customlist",
            "object_id": 3,
            "attendees": [
                5, 7
            ],
            "groups": [
                10
            ]
        },
		{
            "id": 3,
            "guide": 7,
            "content_type": "custom_list.customlist",
            "object_id": 4,
            "attendees": [
                23, 42
            ],
            "groups": []
        }
	]
}
```


This endpoint can also be used to read data on `GatedFeature`.

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/gated-feature/`

### Model Fields

Same as the fields used in creation with the addition of the following read-only fields

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | A unique identifier for your `GatedFeature`.
created_at      | datetime | Time when this `GatedFeature` was created - UTC.


### Filtering data by `Guide` id

Including a query parameter `guide` allows you to filter for all `GatedFeatures` related to a `Guide` you have access to (`Guide` 47 in this example):

`GET https://builder.guidebook.com/open-api/v1/gated-features/?guide=47`


## Retrieving a `GatedFeature`
In the following examples, we will assume that the id of the `GatedFeature` we'd like to modify is 71.
To retrieve an individual `GatedFeature` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/gated-features/71/`

## Adding `Attendees` and `Groups` to a `GatedFeature`

To add Attendees or Groups to a `GatedFeature`, issue a `POST` request like:

`POST https://builder.guidebook.com/open-api/v1/gated-features/71/add-access/`

The body of the POST request should be a dictionary like...`{"attendees": [<attendee_id_1>, <attendee_id_2>, <attendee_id_n>], "groups": [<group_id_1>, <group_id_2>, <group_id_n>]}`.

## Removing `Attendees` and `Groups` from a `GatedFeature`

To remove Attendees or Groups from a `GatedFeature`, issue a `POST` request like:

`POST https://builder.guidebook.com/open-api/v1/gated-features/71/remove-access/`

The body of the POST request should be a dictionary like...`{"attendees": [<attendee_id_1>, <attendee_id_2>, <attendee_id_n>], "groups": [<group_id_1>, <group_id_2>, <group_id_n>]}`.


## Deleting a `GatedFeature`

To delete a particular `GatedFeature`, issue a `DELETE` request to the url that points to the specific `GatedFeature` you'd like deleted. This will make the content object accessible to all users.

`DELETE https://builder.guidebook.com/open-api/v1/gated-features/71/`
