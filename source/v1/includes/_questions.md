# Questions

## Creating a `Question`


```python
import requests

free_response_question_url =  'https://builder.guidebook.com/open-api/v1/free-response-questions/'
api_key = 'API_KEY'
post_data =
{
    "question_set": 42,
    "text": "What did you think of the event?",
    "requires_answer": false,
    "rank": 1.0,
    "display_type": 2
}
response = request.post(free_response_question_url, data=post_data, headers={'Authorization': 'JWT ' + api_key})

```

> The above command returns JSON structured like this:

```json
{
	"id": 3,
    "question_set": 42,
    "text": "What did you think of the event?",
    "requires_answer": false,
    "rank": 1.0,
    "display_type": 2,
    "created_at": "2019-06-27T07:38:58.471042+0000",
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
display_type    | no  | integer  | Options are 1 for short text display and 2 for long text display.  Defaults to 1.


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
choices         | yes       | list of integers   | The title of your `QuestionSet`.
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
    "count": 1,
    "next": null,
    "previous": null,
    "results": [
        {
            "id": 42,
            "question_set": 1,
            "text": "Rate the session on scale of 1 to 10",
            "requires_answer": true,
            "rank": 1.0,
            "scale_min_value": 1,
            "scale_max_value": 10,
            "scale_min_label": "Poor",
            "scale_max_label": "Excellent",
            "created_at": "2019-06-27T07:38:58.471042+0000",
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
id              | integer  | An unique identifier for your `Question`.
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
