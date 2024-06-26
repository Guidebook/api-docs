# QuestionSets

## Creating a `QuestionSet`


```python
import requests

question_sets_url =  'https://builder.guidebook.com/open-api/v1/question-sets/'
api_key = 'API_KEY'
post_data =
{
  "guide": 1,
  "is_branch": false,
  "name": "Test Question Set"
}
response = requests.post(question_sets_url, data=post_data, headers={'Authorization': 'JWT ' + api_key})

```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "created_at": "2019-06-24T02:28:28.088618+0000",
  "last_updated": "2019-06-24T02:28:28.088638+0000",
  "is_branch": false,
  "guide": 1,
  "name": "Test Question Set"
}

```


`QuestionSets` are part of the larger feature of `Forms`.   The organization of the models is as follows.  You can create a `QuestionSet` that is the container for your question objects.  You can then create all the questions you want and link these to the `QuestionSet` container.   Finally, you can then link your `QuestionSet` object to a `Form` object.  This `Form` object will control additional options on how you want to handle response submissions from your `Attendees`.

<aside class="notice">
You must be using a Guide that is configured to use the new Forms feature that launched June 2019.  Legacy forms are not supported for the Open API.
</aside>



### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/question-sets/`

### Model Fields

Parameter       | Required  | Type    | Description
---------       | --------  | ------- | -----------
guide           | yes | integer  | The specific `Guide` your `QUestionSet` belongs to.  See section on [Guides](#guides) for more info.
name            | yes | string   | The title of your `QuestionSet`.
is_branch       | no  | boolean  | A booelan value that indicates if this `QuestionSet` is a branch off an existing `Question`.


## Listing `QuestionSets`

This endpoint will list all `QuestionSets` that are owned by your Account. Typically, this endpoint is called with a `guide` filter such that it returns a list of `QuestionSets` associated to a lone `Guide` object that is owned by you.


```python
import requests

question_sets_url =  'https://builder.guidebook.com/open-api/v1/question-sets/'
api_key = 'API_KEY'

# This will return all question sets you have access to
response = requests.get(question_sets_url, headers={'Authorization': 'JWT ' + api_key})
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
      "created_at": "2019-06-24T02:26:54.616653+0000",
      "last_updated": "2019-06-24T02:26:54.616670+0000",
      "is_branch": false,
      "guide": 2,
      "name": "Question Set"
    },
    {
      "id": 3,
      "created_at": "2019-06-24T02:26:54.618841+0000",
      "last_updated": "2019-06-24T02:26:54.618858+0000",
      "is_branch": false,
      "guide": 2,
      "name": "Question Set"
    },
    {
      "id": 4,
      "created_at": "2019-06-24T02:26:54.620240+0000",
      "last_updated": "2019-06-24T02:26:54.620257+0000",
      "is_branch": true,
      "guide": 2,
      "name": "Question Set"
    }
  ]
}
```


### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/question-sets/`

### Model Fields

Same as the fields used in creation with the addition of the following read-only fields

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | An unique identifier for your `QuestionSet`.
created_at      | datetime | Time when this `QuestionSet` was created - UTC.


### Filtering By `Guide` id

Including a query parameter `guide` allows you to filter for all `QuestionSets#` related to a `Guide` you have access to (`Guide` 47 in the following example):

`GET https://builder.guidebook.com/open-api/v1/question-sets/?guide=47`

## Retrieving a `QuestionSet`
In the following examples, we will assume that the id of the `QuestionSet` we'd like to modify is 71.
To retrieve an individual `QuestionSet` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/question-sets/71/`

## Updating a `QuestionSet`

To modify an existing `QuestionSet` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1/question-sets/71/`

You will only need to include the specific fields you are updating and not a full request body.

## Deleting a `QuestionSet`

To delete a particular `QuestionSet`, issue a `DELETE` request to the url that points to the specific `QuestionSet` you'd like deleted:

`DELETE https://builder.guidebook.com/open-api/v1/question-sets/71/`
