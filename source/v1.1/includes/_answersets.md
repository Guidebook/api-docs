# FormAnswerSets

## Listing `FormAnswerSets`

This endpoint will list all `FormAnswerSets` that are owned by your Account.

<aside class="notice">
You must be using a Guide that is configured to use the new Forms feature that launched June 2019. Legacy forms are not supported for the Open API.
</aside>


```python
import requests

answer_set_url =  'https://builder.guidebook.com/open-api/v1.1/answer-sets/?survey=23&object_id=42939'
api_key = 'API_KEY'

# This will return all answers for the given form
response = requests.get(answer_set_url, headers={'Authorization': 'JWT ' + api_key})
```

> The above command returns JSON structured like this:

```json
{
  "count": 3,
  "next": null,
  "previous": null,
  "results": [
    {
      "object_id": 42939,
      "survey": 23,
      "user": null,
      "content_type": "schedule.session",
      "survey_version_number": 1,
      "id": 152,
      "device_id": "bc07a281f9cc1f3d47fc864e",
      "completed_at":"2019-06-24T05:36:30.846778+0000"
    },
    {
      "object_id": 42939,
      "survey": 23,
      "user": null,
      "content_type": "schedule.session",
      "survey_version_number": 1,
      "id": 153,
      "device_id": "cb7f8e68cc11ddf42a6",
      "completed_at":"2019-06-24T05:36:30.846778+0000"
    },
    {
      "object_id": 42939,
      "survey": 23,
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

`GET https://builder.guidebook.com/open-api/v1.1/answer-sets/`

### Model Fields

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | An unique identifier for your `FormAnswerSets`.
survey          | integer | The Form that this `FormAnswerSets` is for.
content_type	| string  | The content type of the object this `FormAnswerSets` is for.
object_id       | integer | The object ID that this `FormAnswerSets` is for.
device_id	    | string  | Unique identifier for the device that submitted this `FormAnswerSets`.
survey_version_number  | integer  | Tracks what revision this form is on.
completed_at    | datetime | The date and time that this `FormAnswerSet` was submitted.
user            | integer | The ID of the user that submitted this `FormAnswerSet`. This will be null if the user was not logged in.



## Retrieving a specific `AnswerSet`
If you would like to see the details of a specific `FormAnswerSets` submitted, you can use the following detail URL to examine the detailed response data.  The example below is fetching `FormAnswerSets` 71.
To retrieve an individual `FormAnswerSets` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1.1/answer-sets/71/answers/`


```python

answer_set_detail_url =  'https://builder.guidebook.com/open-api/v1.1/answer-sets/71/answers/'
api_key = 'API_KEY'

# This will return all answers for the given form
response = requests.get(answer_set_detail_url, headers={'Authorization': 'JWT ' + api_key})
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 13,
    "question_uuid": "4e481586-85bc-4cc1-a33b-0c78b29a2366",
    "question_type": "sliding-scale",
    "question_text": "test 1",
    "answer": "3",
    "multi_choice_answers": []
  },
  {
    "id": 14,
    "question_uuid": "77cdabbc-d9d1-440c-9602-9574a062e7b4",
    "question_type": "free-response",
    "question_text": "test 1",
    "answer": "test answer",
    "multi_choice_answers": []
  },
  {
    "id": 15,
    "question_uuid": "315e41ca-ced4-4fce-8c35-1b98d680e472",
    "question_type": "multiple-choice",
    "question_text": "test 1",
    "answer": "",
    "multi_choice_answers": [
      "french fries",
      "soda",
      "hamburger"
    ]
  }
]

```


### Model Fields

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | An unique identifier for your `Answer`.
question_uuid	| string  | The uuid of the Question this `Answer` is linked to.
question_type   | string  | The type of the Question this `Answer` is linked to.
question_text   | string  | The text of the Question this `Answer` is linked to.
answer    	    | string  | The answer text that was submitted.
multi_choice_answers  | list of strings  | Since multiple choice questions can have multiple answers.  They will appear as a list of strings here.
