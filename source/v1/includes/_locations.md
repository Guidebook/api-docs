# Locations

`Location` objects can be added to `Sessions` and `CustomListItems` to give users additional context about where an event or point of interest is located.

## Creating `Locations`


```python

url = 'https://builder.guidebook.com/open-api/v1/locations/'
api_key = 'API_KEY'
post_data =
{
  "guide": 1,
  "name": "Stadium",
  "description": null,
  "location_type": 3,
  "latitude": 37.3327,
  "longitude": -121.901236,
  "import_id": null
}
response = requests.post(url, data=post_data, headers={'Authorization': 'JWT ' + api_key}).json()
```

> The above command returns JSON structured like this:

```json
{
  "id": 89,
  "guide": 1,
  "name": "Stadium",
  "description": null,
  "location_type": 3,
  "latitude": 37.3327,
  "longitude": -121.901236,
  "import_id": null,
  "address": null,
  "created_at": "2017-09-25T20:18:28.052157+0000"
}
```

### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/locations/`

### Model Fields

Property          | Required    | Type        | Description
---------         | --------    | --------    | --------
guide             | yes         | integer     | id of the `Guide` this `Location` belongs to.
name              | yes         | string      | Name of this `Location`.
import_id         | no          | string      | A string field you can used to input your own identifier. This is for when you have your own IDs for `Locations` in your data store.
location_type     | yes         | integer     | Either 1, 2 or 3. 1 is the special Main Venue location. 2 is a Placeholder location.  3 is a "Google Maps Location"
latitude          | sometimes   | float       | Latitude of this `Location` - only required if this `Location` is of type ("Google Maps `Location`") or ("Main Venue" `Location`).
longitude         | sometimes   | float       | Longitude of this `Location` - only required if this `Location` is of type ("Google Maps `Location`") or ("Main Venue" `Location`).
address           | sometimes   | json        | Address of the [Main Venue](#the-main-venue-code-location-code).  JSON dictionary with the keys ['address', city', 'country', 'state', 'street', 'zipcode']

## Listing `Locations`


```python
import requests

url = 'https://builder.guidebook.com/open-api/v1/locations/'
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
      "id": 2,
      "guide": 1,
      "name": "Conference Hall A",
      "description": null,
      "location_type": 2,
      "latitude": null,
      "longitude": null,
      "import_id": null,
      "address": null,
      "created_at": "2017-08-31T20:18:28.018529+0000"
    },
    {
      "id": 3,
      "guide": 1,
      "name": "Lobby",
      "description": null,
      "location_type": 2,
      "latitude": null,
      "longitude": null,
      "import_id": null,
      "address": null,
      "created_at": "2017-08-31T20:18:28.038556+0000"
    },
    {
      "id": 4,
      "guide": 1,
      "name": "Meeting Place",
      "description": null,
      "location_type": 3,
      "latitude": 37.7749,
      "longitude": -122.4194,
      "import_id": null,
      "address": null,
      "created_at": "2017-08-31T20:18:28.052157+0000"
    }
  ]
}
```


### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/locations/`

### Model Fields

Same as the fields used in creation with the addition of the following read-only fields:

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | An unique identifier for your `Location`.
created_at      | datetime | Time when this `Location` was created - UTC.

### Filtering `Locations`

To filter the returned `Locations` by their `location_type` include the query parameter `location_type`. The following request, for examples, filters for `Locations` with `location_type` 2.  Additionally, you can also filter by `guide` to limit to locations belonging to a specific guide.

`GET https://builder.guidebook.com/open-api/v1/locations/?location_type=2`

`GET https://builder.guidebook.com/open-api/v1/locations/?location_type=2&guide=42`

## Manipulating Individual `Locations`


> Update the name of a `Location`

```python

url = 'https://builder.guidebook.com/open-api/v1/locations/89/'
api_key = 'API_KEY'
patch_data =
{
  "name": "San Jose Sharks Stadium"
}
response = requests.patch(url, data=patch_data, headers={'Authorization': 'JWT ' + api_key}).json()
```

> PATCH requests (to update) and GET requests (to retrieve) an individual Location will return a JSON structure like this:

```json
{
  "id": 89,
  "guide": 1,
  "name": "San Jose Sharks Stadium",
  "description": null,
  "location_type": 3,
  "latitude": 37.3327,
  "longitude": -121.901236,
  "import_id": null,
  "address": null,
  "created_at": "2017-09-25T20:18:28.052157+0000"
}
```


To access and manipulate an individual `Location` object, use a url that ends with the id of a `Location` object:

`https://builder.guidebook.com/open-api/v1/locations/<location_id>/`

## Retrieving a Location
In the following examples, we will assume that the id of the `Locations` we'd like to modify is 89.
To retrieve an individual `Location` object, issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/locations/89/`

## Updating a `Location`

To modify an existing `Location` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1/locations/89/`

You will only need to include the specific fields you are updating and not a full request body.

## Deleting a `Location`

To delete a particular `Location`, issue a `DELETE` request to the url that points to the specific `Location` you'd like deleted:

`DELETE https://builder.guidebook.com/open-api/v1/locations/89/`


## The Main Venue `Location`

The Main Venue is a special `Location` object for the `Guide` and represents the main location for your `Guide`.  There is only one Main Venue location allowed per guide and any attempts to create more than one Main Venue will result in validation errors.  This `Location` requires a JSON dictionary of the address and the longitude and latitude values of this address.  If you do not have the longitude and latitude for the venue, you can submit just the address dictionary and we will attempt to geocode the address to the closest longitude and latitude we can find.

```python
# First fetch the ID of the Main Venue object
api_key = 'API_KEY'

url = 'https://builder.guidebook.com/open-api/v1/locations/?location_type=1&guide_id=21'
response = requests.get(url, headers={'Authorization': 'JWT ' + api_key}).json()
main_venue_id = response.json()['results'][0]['id']

update_url = 'https://builder.guidebook.com/open-api/v1/locations/{}/'.format(main_venue_id)
patch_data =
{
  "latitude": 37.784172,
  "name": "Moscone Center",
  "longitude": -122.401558,
  "address": "{\"city\": \"San Francisco\", \"country\": \"U.S.A.\", \"zipcode\": \"94103\", \"state\": \"CA\", \"street\": \"747 Howard Street\", \"address\": \"Moscone Center\"}"
}
response = requests.patch(url, data=patch_data, headers={'Authorization': 'JWT ' + api_key}).json()
```

> PATCH requests to update the Main Venue will return a JSON structure like this:

```json
{
	"id": 5,
	"guide": 3,
	"name": "Moscone Center",
	"description": null,
	"location_type": 1,
	"latitude": 37.784172,
	"longitude": -122.401558,
	"import_id": null,
	"created_at": "2018-05-29T02:21:48.336713+0000",
	"address": {
		"city": "San Francisco",
		"country": "U.S.A.",
		"zipcode": "94103",
		"state": "CA",
		"street": "747 Howard Street",
		"address": "Moscone Center"
	}
}```

