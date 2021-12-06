# Guidebook ID

Guidebook ID is a QR code that identifies attendees. It is scannable and holds some attendee information.

The QR code contains a url encoded query string. You will have to decode the query string in order to get the original values.


## Guidebook ID query string properties


Property           | Type        | Description
---------          | --------    | --------
f                  | string      | First name of the attendee. Optional: This can be omitted from the query string
l                  | string      | Last name of the attendee Optional: This can be omitted from the query string
i                  | integer     | The attendee ID
ii                 | string.     | Import id: If the user is imported from an external source, the importer can specify a customized id to append to each user.


## Verifying Guidebook ID is issued by Guidebook

This endpoint will verify the QR code query string content is issued by Guidebook.

The verification of the QR code can be checked by the response's status code and message.

You can get the following response code & related message:
HTTP 200 - This is a valid Guidebook ID QR code
HTTP 400 - This is an invalid Guidebook ID QR code
HTTP 400 - `qr_badge` is not in the request data.

```python
import requests

verify_guidebook_id_badge_url = 'https://builder.guidebook.com/open-api/v1/verify-qr-badge/'
api_key = 'API_KEY'
post_data = {
    'qr_badge': 'QR_BADGE_QUERY_STRING'
}

response = request.post(verify_guidebook_id_badge_url, data=post_data, headers={'Authorization': 'JWT ' + api_key})

is_valid_guidebook_id = response.status_code == 200
```

### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/verify-qr-badge/`

### Fields

Parameter       | Required  | Type    | Description
---------       | --------  | ------- | -----------
qr_badge        | yes | string  | The query string contained in the Guidebook ID QR code



