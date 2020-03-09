# Images

Some resources (like `Sessions` and `CustomListItems`) can be associated to images that will be displayed in Guidebook apps. To upload images, you can submit a multipart request. A code example accompanies this section that [uploads an image to a `Session` using the python `requests` package](https://requests.readthedocs.io/en/master/user/quickstart/#post-a-multipart-encoded-file).


> Example request that changes the name *and* image of an existing `Session`

```python
import requests

api_url = 'https://builder.guidebook.com/open-api/v1/sessions/71/'
api_key = 'API_KEY'
headers = {'Authorization': 'JWT ' + api_key}
image_file = open('your_image_file.png', 'rb')
requests.patch(api_url, {'name': 'updated session name'}, files={'image': image_file}, headers=headers)
```
