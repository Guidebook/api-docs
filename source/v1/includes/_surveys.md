# Surveys

## Creating a `Survey`


```python
import requests

survey_url =  'https://builder.guidebook.com/open-api/v1/surveys/'
api_key = 'API_KEY'
post_data =
{
    "question_set": 32,
    "submission_rule_type": 1,
    "user_login_required": false,
    "label": "Please Fill in this Form",
    "name": "Event Feedback Survey",
    "description": "Survey for gathering feedback about the event.",
    "is_collecting_responses": true,
}
response = request.post(survey_url, data=post_data, headers={'Authorization': 'JWT ' + api_key})

```

> The above command returns JSON structured like this:

```json
{
    "id": 482,
    "created_at": "2019-06-27T07:38:58.471042+0000",
    "question_set": 32,
    "submission_rule_type": 1,
    "user_login_required": false,
    "label": "Please Fill in this Form",
    "name": "Event Feedback Survey",
    "description": "Survey for gathering feedback about the event.",
    "is_collecting_responses": true,
}

```


`Surveys` are the top level model that allows you to control the UI and submission behavior for `QuestionSets` and `Questions`.   The organization of the models is as follows.  You can create a `QuestionSet` that is the container for your question objects.  You can then create all the questions you want and link these to the `QuestionSet` container.   Finally, you can then link your `QuestionSet` object to a `Survey` object.  This `Survey` object will control additional options on how you want to handle response submissions from your `Attendees`.

<aside class="notice">
You must be using a Guide that is configured to use the new Surveys feature that launched June 2019.  Legacy surveys are not supported for the Open API.
</aside>



### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/surveys/`

### Model Fields

Parameter       | Required  | Type    | Description
---------       | --------  | ------- | -----------
question_set    | yes | integer  | The specific `QuestionSet` your `Survey` is linked to.  See section on [QuestionSets](#question_sets) for more info.
submission_rule_type  | yes  | integer  | Options are 1 for single submission, 2 is for revisions allowed, and 3 is for multiple submissions.  Defaults to 1.
user_login_required   | no  | boolean  | A booelan value that indicates if an user needs to be logged in before they can submit an answer to this `Survey`.
label            | no | string   | Label field for your `Survey`.
name             | no | string   | The title of your `Survey`.
description      | no | string   | The description of your `Survey`.
is_collecting_responses   | no  | boolean  | A booelan value that indicates if this `Survey` is collecting responses.


## Listing `Surveys`

This endpoint will list all `Surveys` that are owned by your Account.


```python
import requests

survey_url =  'https://builder.guidebook.com/open-api/v1/surveys/'
api_key = 'API_KEY'

# This will return all surveys you have access to
response = request.get(survey_url, headers={'Authorization': 'JWT ' + api_key})
```

> The above command returns JSON structured like this:

```json
{
    "count": 1,
    "next": null,
    "previous": null,
    "results": [
        {
            "id": 482,
            "created_at": "2019-06-27T07:38:58.471042+0000",
            "question_set": 32,
            "submission_rule_type": 1,
            "user_login_required": false,
            "label": "Please Fill in this Form",
            "name": "Event Feedback Survey",
            "description": "Survey for gathering feedback about the event.",
            "is_collecting_responses": true,
        }
    ]
}
```


### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/surveys/`

### Model Fields

Same as the fields used in creation with the addition of the following read-only fields

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | An unique identifier for your `QuestionSet`.
created_at      | datetime | Time when this `QuestionSet` was created - UTC.


## Retrieving a `Survey`
In the following examples, we will assume that the id of the `Survey` we'd like to modify is 71.
To retrieve an individual `Survey` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/surveys/71/`

## Updating a `Survey`

To modify an existing `Survey` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1/surveys/71/`

You will only need to include the specific fields you are updating and not a full request body.

## Deleting a `Survey`

To delete a particular `Survey`, issue a `DELETE` request to the url that points to the specific `Survey` you'd like deleted:

`DELETE https://builder.guidebook.com/open-api/v1/surveys/71/`
