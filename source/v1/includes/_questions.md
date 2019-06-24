# Questions

## Creating a `Question`


```python
import requests

free_response_question_url =  'https://builder.guidebook.com/open-api/v1/free-response-questions/'
api_key = 'API_KEY'
post_data =
{
  "question_set": 42,
  "display_type": "short-text",
  "rank": 1,
  "requires_answer": false,
  "text": "What did you think of the event?"
}
response = request.post(free_response_question_url, data=post_data, headers={'Authorization': 'JWT ' + api_key})

```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "question_type": "free-response",
  "text": "What did you think of the event?",
  "requires_answer": false,
  "display_type": "short-text",
  "question_set": {
    "id": 1,
    "created_at": "2019-06-24T04:13:51.215868+0000",
    "last_updated": "2019-06-24T04:13:51.215888+0000",
    "is_branch": false,
    "guide": 1,
    "name": "Question Set"
  },
  "rank": 1,
  "uuid": "4e2e2d69-735c-482b-a902-6cf6793aa7fb"
}

```

```python
import requests

grid_question_url =  'https://builder.guidebook.com/open-api/v1/grid-questions/'
api_key = 'API_KEY'
post_data =
{
  "question_set": 1479,
  "rank": 1,
  "text": "Test Grid Question",
  "questions": [
    {
      "text": "question a",
      "rank": 0
    },
    {
      "text": "second question",
      "rank": 1
    },
    {
      "text": "last question",
      "rank": 2
    }
  ],
  "requires_answer": false
}
response = request.post(grid_question_url, data=post_data, headers={'Authorization': 'JWT ' + api_key})

```

> The above command returns JSON structured like this:

```json
{
  "id": 364,
  "question_type": "grid",
  "text": "Test Grid Question",
  "requires_answer": false,
  "questions": [
    {
      "id": 1,
      "text": "question a",
      "rank": 0,
      "uuid": "3d00fe34-478f-49de-a3a3-f77263996ad3"
    },
    {
      "id": 2,
      "text": "second question",
      "rank": 1,
      "uuid": "48a9b985-b1de-4adf-99a6-2f2a2c752eee"
    },
    {
      "id": 3,
      "text": "last question",
      "rank": 2,
      "uuid": "0d508d26-7892-4a7c-9623-e1f5b3beb8cb"
    }
  ],
  "question_set": {
    "id": 2,
    "created_at": "2019-06-24T04:42:53.268110+0000",
    "last_updated": "2019-06-24T04:42:53.268131+0000",
    "is_branch": false,
    "guide": 2,
    "name": "Question Set"
  },
  "rank": 1,
  "choices": [],
  "uuid": "74c17df2-40f6-46e4-aa7d-449729641a52"
}

```


```python
import requests

mc_question_choice_url =  'https://builder.guidebook.com/open-api/v1/multiple-choice-question-choices/'
api_key = 'API_KEY'
post_data =
{
  "rank": 1,
  "text": "second choice",
  "grid_choice_question": 364,
  "multiple_choice_question": null
}
response = request.post(mc_question_choice_url, data=post_data, headers={'Authorization': 'JWT ' + api_key})

```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "text": "second choice",
  "question_branch": null,
  "rank": 1,
  "multiple_choice_question": null,
  "grid_choice_question": 2,
  "question_set": {
    "id": 3,
    "created_at": "2019-06-24T05:00:22.759672+0000",
    "last_updated": "2019-06-24T05:00:22.759687+0000",
    "is_branch": false,
    "guide": 3,
    "name": "Question Set"
  }
}

```


There are four distinct types of `Questions` you can create via the Open API.  The above examples illustrate how you can create Free Response Questions, Multiple Choice Questions, Sliding Scale Questions, and Grid Questions.

<aside class="notice">
You must be using a Guide that is configured to use the new Surveys feature that launched June 2019.  Legacy surveys are not supported for the Open API.
</aside>



### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/free-response-questions/`

### Model Fields

Parameter       | Required  | Type    | Description
---------       | --------  | ------- | -----------
question_set    | yes | integer  | The specific `QuestionSet` your `Question` belongs to.  See section on [QuestionSets](#questionsets) for more info.
text            | yes | string   | The text of your `Question`.
requires_answer | no  | boolean  | A booelan value that indicates if this `Question` requires an answer from the end-user.
rank            | yes | float    | Controls the display order in the `QuestionSet`.  `Questions` are displayed in ascending order.
display_type    | yes  | string  | Options are 'short-text' display or 'long-text' display.


`POST https://builder.guidebook.com/open-api/v1/sliding-scale-questions/`

### Model Fields

Parameter       | Required  | Type    | Description
---------       | --------  | ------- | -----------
question_set    | yes | integer  | The specific `QuestionSet` your `Question` belongs to.  See section on [QuestionSets](#questionsets) for more info.
text            | yes | string   | The text of your `Question`.
requires_answer | no  | boolean  | A booelan value that indicates if this `Question` requires an answer from the end-user.
rank            | yes | float    | Controls the display order in the `QuestionSet`.  `Questions` are displayed in ascending order.
scale_min_value | yes | integer  | The minimum value to display for the sliding scale.  Lowest value is 0.
scale_max_value | yes | integer  | The maximum value to display for the sliding scale.  Highest value is 10.
scale_min_label | no  | string   | An optional label for the minimum value on the scale.
scale_max_label | no  | string   | An optional label for the maximum value on the scale.

`POST https://builder.guidebook.com/open-api/v1/multiple-choice-questions/`

### Model Fields

Parameter       | Required  | Type    | Description
---------       | --------  | ------- | -----------
question_set    | yes | integer  | The specific `QuestionSet` your `Question` belongs to.  See section on [QuestionSets](#questionsets) for more info.
text            | yes | string   | The text of your `Question`.
requires_answer | no  | boolean  | A booelan value that indicates if this `Question` requires an answer from the end-user.
rank            | yes | float    | Controls the display order in the `QuestionSet`.  `Questions` are displayed in ascending order.
display_type    | no  | integer  | Options are 1 for list display and 2 for drop down display.  Defaults to 1.
selection_type  | no  | integer  | Options are 1 for single answer and 2 for multiple answer.  Defaults to 1.
num_required_answers | yes | integer |  The minimum number of required selections to be considered a valid submission.
required_exact_number_of_answers | no  | boolean | A boolean value that indicates if the exact number of answers defined in `num_required_answers` need to be submitted.


`POST https://builder.guidebook.com/open-api/v1/multiple-choice-question-choices/`

### Model Fields

Parameter                | Required  | Type    | Description
---------                | --------  | ------- | -----------
multiple_choice_question | no        | integer | The id of the specific Multiple Choice Question your choice belongs to.
grid_choice_question     | no        | integer | The id of the specific Grid Question this choice belongs to.  Either this field OR multiple_choice_question needs to be filled in.
text                     | yes       | string  | The text of your choice.
rank                     | yes       | float   | Controls the display order of this choice.
question_branch          | no        | integer | The id of the `QuestionSet` branch that this choice will branch off into if selected.


`POST https://builder.guidebook.com/open-api/v1/grid-questions/`

### Model Fields

Parameter       | Required  | Type    | Description
---------       | --------  | ------- | -----------
question_set    | yes       | integer  | The specific `QuestionSet` your `Question` belongs to.  See section on [QuestionSets](#questionsets) for more info.
choices         | yes       | list of integers   | The list of multiple question choices for the grid question.
questions       | yes       | list of dictionaries  | A list of dictionaries of the questions in this grid question.  The dictinoary should simply contain a `text` (string) key and a `rank` (float) key.


## Listing `Questions`

The following endpoints will list all `Questions` that are owned by your Account. Typically, these endpoints are called with a `guide` filter such that it returns a list of `Questions` associated to a lone `Guide` object that is owned by you.  There is a dedicated endpoint for each type of `Question`.


```python
import requests

sliding_scale_question_lists_url =  'https://builder.guidebook.com/open-api/v1/sliding-scale-questions/'
api_key = 'API_KEY'

# This will return all sliding scale questions you have access to
response = request.get(sliding_scale_question_lists_url, headers={'Authorization': 'JWT ' + api_key})
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
      "question_type": "sliding-scale",
      "text": "Rate this session on a scale of 1-10, 10 being the best.",
      "requires_answer": false,
      "scale_min_value": 0,
      "scale_max_value": 10,
      "question_set": {
        "id": 2,
        "created_at": "2019-06-24T04:08:41.778921+0000",
        "last_updated": "2019-06-24T04:08:41.778945+0000",
        "is_branch": false,
        "guide": 2,
        "name": "Question Set"
      },
      "rank": 1,
      "scale_min_label": "",
      "scale_max_label": "",
      "uuid": "3827e773-c764-43eb-bd2f-c45a0374a9fe"
    },
    {
      "id": 2,
      "question_type": "sliding-scale",
      "text": "Rate this session on a scale of 1-5, 5 being the best.",
      "requires_answer": false,
      "scale_min_value": 0,
      "scale_max_value": 5,
      "question_set": {
        "id": 2,
        "created_at": "2019-06-24T04:08:41.778921+0000",
        "last_updated": "2019-06-24T04:08:41.778945+0000",
        "is_branch": false,
        "guide": 2,
        "name": "Question Set"
      },
      "rank": 2,
      "scale_min_label": "",
      "scale_max_label": "",
      "uuid": "482c23d4-618d-431e-8913-df17790c09aa"
    },
    {
      "id": 3,
      "question_type": "sliding-scale",
      "text": "Rate this session on a scale of 3-7, 7 being the worst.",
      "requires_answer": false,
      "scale_min_value": 3,
      "scale_max_value": 7,
      "question_set": {
        "id": 2,
        "created_at": "2019-06-24T04:08:41.778921+0000",
        "last_updated": "2019-06-24T04:08:41.778945+0000",
        "is_branch": false,
        "guide": 2,
        "name": "Question Set"
      },
      "rank": 3,
      "scale_min_label": "best",
      "scale_max_label": "worst",
      "uuid": "ae98389a-5e64-4421-b536-bc034309aa96"
    }
  ]
}
```


### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/free-response-questions/`

`GET https://builder.guidebook.com/open-api/v1/sliding-scale-questions/`

`GET https://builder.guidebook.com/open-api/v1/multiple-choice-questions/`

`GET https://builder.guidebook.com/open-api/v1/grid-questions/`


### Model Fields

Same as the fields used in creation with the addition of the following read-only fields

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | An unique identifier for your `Question`.  Note that this is not unique across question types.
uuid			| uuid     | An unique identifier for your `Questio`.  Unique across question types.
created_at      | datetime | Time when this `Question` was created - UTC.


## Retrieving a `Question`
In the following examples, we will assume that the id of the Multiple Choice `Question` we'd like to modify is 71.
To retrieve an individual `Question` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/multiple-choice-questions/71/`

## Updating a `Question`

To modify an existing `Question` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1/multiple-choice-questions/71/`

You will only need to include the specific fields you are updating and not a full request body.

## Deleting a `Question`

To delete a particular `Question`, issue a `DELETE` request to the url that points to the specific `Question` you'd like deleted:

`DELETE https://builder.guidebook.com/open-api/v1/multiple-choice-questions/71/`
