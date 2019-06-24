# AnswerSets

## Listing `AnswerSets`

This endpoint will list all `AnswerSets` that are owned by your Account.


```python
import requests

answer_set_url =  'https://builder.guidebook.com/open-api/v1/answer-sets/?survey=23&object_id=42939'
api_key = 'API_KEY'

# This will return all answers for the given survey
response = request.get(answer_set_url, headers={'Authorization': 'JWT ' + api_key})
```

> The above command returns JSON structured like this:

```json
{
  "count": 3,
  "next": null,
  "previous": null,
  "results": [
    {
      "object_id": 14253860,
      "survey": 2,
      "user": null,
      "content_type": "schedule.session",
      "survey_version_number": 1,
      "id": 152,
      "device_id": "bc07a281f9cc1f3d47fc864e",
      "completed_at":"2019-06-24T05:36:30.846778+0000"
    },
    {
      "object_id": 14253860,
      "survey": 2,
      "user": null,
      "content_type": "schedule.session",
      "survey_version_number": 1,
      "id": 153,
      "device_id": "cb7f8e68cc11ddf42a6",
      "completed_at":"2019-06-24T05:36:30.846778+0000"
    },
    {
      "object_id": 14253860,
      "survey": 2,
      "user": 1,
      "content_type": "schedule.session",
      "survey_version_number": 1,
      "id": 101,
      "device_id": "i13cb7f313d2d229f",
      "completed_at":"2019-06-24T05:36:30.846778+0000"
    }
  ]
}
```


### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/answer-sets/`

### Model Fields

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | An unique identifier for your `AnswerSet`.
survey          | integer | The Survey that this AnswerSet is for.
content_type	| string  | The content type of the object this AnswerSet is for.
object_id       | integer | The object ID that this AnswerSet is for.
device_id	    | string  | Unique identifier for the device that submitted this AnswerSet.
survey_version_number  | integer  | Tracks what revision this survey is on.


## Retrieving a specific `AnswerSet`
If you would like to see the details of a specific `AnswerSet` submitted, you can use the following detail URL to examine the detailed response data.
To retrieve an individual `AnswerSet` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/answer-sets/71/answers/`


```python
import requests

answer_set_detail_url =  'https://builder.guidebook.com/open-api/v1/answer-sets/71/answers/'
api_key = 'API_KEY'

# This will return all answers for the given survey
response = request.get(answer_set_detail_url, headers={'Authorization': 'JWT ' + api_key})
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "question_uuid": "72811ad9-dabe-4f17-824d-85d970e98f78",
    "question_type": "sliding-scale",
    "answer": "3",
    "multi_choice_answer_ids": []
  },
  {
    "id": 2,
    "question_uuid": "c06e503b-03ca-494f-b470-759544571686",
    "question_type": "free-response",
    "answer": "test answer",
    "multi_choice_answer_ids": []
  },
  {
    "id": 3,
    "question_uuid": "77d6398a-753f-4140-8fda-f83474f25e1e",
    "question_type": "multiple-choice",
    "answer": "",
    "multi_choice_answer_ids": [
      1,
      2,
      3
    ]
  }
]
```
