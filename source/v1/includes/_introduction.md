# Introduction

Guidebook offers a REST API to manage a subset of the resources available in the [Guidebook Builder CMS](https://builder.guidebook.com). Our Open API uses resource-oriented urls, standard HTTP response codes, and HTTP verbs to segment different types of requests.

Here are, for example, some typical response codes you might encounter:

Code                  | Description
---------             | --------
200                   | OK. Request received and processed successfully.
201                   | Created. The request has been fulfilled and has resulted in one or more new resources being created.
400                   | Bad request. The request is malformed and has not been accepted.
401                   | Unauthorized. Your API Key was rejected.
403                   | Forbidden. You do not have permission to perform that action.
404                   | Not found. The requested URL is not found on the server.
429                   | Too many requests. You have hit the Open API too quickly.
500, 502, 503, 504    | Server error. Something is wrong on Guidebook's end. Please try again later.
