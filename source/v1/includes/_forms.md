# Forms

## Creating a `Form`


```python
import requests

form_url =  'https://builder.guidebook.com/open-api/v1/surveys/'
api_key = 'API_KEY'
post_data =
{
  "submission_rule_type": "multiple-submission",
  "description": "Survey for gathering feedback about the event.",
  "name": "Event Feedback Survey",
  "location_content_type": "schedule.session",
  "question_set": 32,
  "user_login_required": false,
  "is_collecting_responses": true,
  "location_object_id": 8765,
  "label": "Please Fill in this Form"
}
response = request.post(form_url, data=post_data, headers={'Authorization': 'JWT ' + api_key})

```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "created_at": "2019-06-24T02:08:42.952413+0000",
  "last_updated": "2019-06-24T02:08:42.952434+0000",
  "label": "Please Fill in this Form",
  "name": "Event Feedback Survey",
  "description": "Survey for gathering feedback about the event.",
  "notification_emails": [],
  "submission_rule_type": "multiple-submission",
  "user_login_required": false,
  "version_number": 0,
  "question_set": {
    "id": 1,
    "created_at": "2019-06-24T02:08:42.901670+0000",
    "last_updated": "2019-06-24T02:08:42.901691+0000",
    "is_branch": false,
    "guide": 1,
    "name": "Question Set"
  },
  "location_content_type": "schedule.session",
  "location_object_id": 1,
  "is_collecting_responses": true
}

```


`Forms` are the top level model that allows you to control the UI and submission behavior for `QuestionSets` and `Questions`.   The organization of the models is as follows.  You can create a `QuestionSet` that is the container for your question objects.  You can then create all the questions you want and link these to the `QuestionSet` container.   Finally, you can then link your `QuestionSet` object to a `Form` object.  This `Form` object will control additional options on how you want to handle response submissions from your `Attendees`.

<aside class="notice">
You must be using a Guide that is configured to use the new Forms feature that launched June 2019.  Legacy forms are not supported for the Open API.
</aside>



### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/surveys/`

### Model Fields

Parameter       | Required  | Type    | Description
---------       | --------  | ------- | -----------
question_set    | yes | integer  | The specific `QuestionSet` your `Form` is linked to.  See section on [QuestionSets](#questionsets) for more info.
submission_rule_type  | yes  | string  | Options are 'single-submission', 'revisions-allowed', 'multiple-submission'
user_login_required   | no  | boolean  | A booelan value that indicates if an user needs to be logged in before they can submit an answer to this `Form`.
label            | no | string   | Label field for your `Form`.
name             | no | string   | The title of your `Form`.
description      | no | string   | The description of your `Form`.
is_collecting_responses   | no  | boolean  | A booelan value that indicates if this `Form` is collecting responses.
location_content_type  | yes | string  | Type of Object you want to link this form to.  The options are: "schedule.session", "custom_list.customlistitem"
location_object_id     | yes | integer | Object ID of the object you want to associate this form with.
notification_emails | no | list of emails  |  List of email addresses to notify when an answer is submmitted for this form.


## Listing `Forms`

This endpoint will list all `Forms` that are owned by your Account.


```python
import requests

form_url =  'https://builder.guidebook.com/open-api/v1/surveys/'
api_key = 'API_KEY'

# This will return all forms you have access to
response = request.get(form_url, headers={'Authorization': 'JWT ' + api_key})
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
      "created_at": "2019-06-24T02:09:39.966166+0000",
      "last_updated": "2019-06-24T02:09:39.966182+0000",
      "label": "Fill out this form",
      "name": "Session Survey",
      "description": "Please fill out this survey for this session.",
      "notification_emails": null,
      "submission_rule_type": "multiple-submission",
      "user_login_required": false,
      "version_number": 0,
      "question_set": {
        "id": 2,
        "created_at": "2019-06-24T02:09:39.964328+0000",
        "last_updated": "2019-06-24T02:09:39.964344+0000",
        "is_branch": false,
        "guide": 2,
        "name": "Question Set"
      },
      "location_content_type": "schedule.session",
      "location_object_id": 2,
      "is_collecting_responses": true
    },
    {
      "id": 3,
      "created_at": "2019-06-24T02:09:39.969125+0000",
      "last_updated": "2019-06-24T02:09:39.969141+0000",
      "label": "Fill out this form",
      "name": "Session Survey",
      "description": "Please fill out this survey for this session.",
      "notification_emails": null,
      "submission_rule_type": "single-submission",
      "user_login_required": false,
      "version_number": 0,
      "question_set": {
        "id": 3,
        "created_at": "2019-06-24T02:09:39.967454+0000",
        "last_updated": "2019-06-24T02:09:39.967470+0000",
        "is_branch": false,
        "guide": 2,
        "name": "Question Set"
      },
      "location_content_type": "schedule.session",
      "location_object_id": 2,
      "is_collecting_responses": true
    },
    {
      "id": 4,
      "created_at": "2019-06-24T02:09:39.971788+0000",
      "last_updated": "2019-06-24T02:09:39.971804+0000",
      "label": "Fill out this form",
      "name": "Session Survey",
      "description": "Please fill out this survey for this session.",
      "notification_emails": null,
      "submission_rule_type": "revisions-allowed",
      "user_login_required": false,
      "version_number": 0,
      "question_set": {
        "id": 4,
        "created_at": "2019-06-24T02:09:39.970123+0000",
        "last_updated": "2019-06-24T02:09:39.970140+0000",
        "is_branch": false,
        "guide": 2,
        "name": "Question Set"
      },
      "location_content_type": "schedule.session",
      "location_object_id": 2,
      "is_collecting_responses": true
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
version_number  | integer  | Tracks what revision this survey is on.


## Retrieving a `Form`
In the following examples, we will assume that the id of the `Form` we'd like to modify is 71.
To retrieve an individual `Form` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/surveys/71/`

## Updating a `Form`

To modify an existing `Form` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1/surveys/71/`

You will only need to include the specific fields you are updating and not a full request body.

## Deleting a `Form`

To delete a particular `Form`, issue a `DELETE` request to the url that points to the specific `Form` you'd like deleted:

`DELETE https://builder.guidebook.com/open-api/v1/surveys/71/`
