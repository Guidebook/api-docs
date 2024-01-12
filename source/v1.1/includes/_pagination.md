# Pagination


```
{
  "count": 85,
  "next": "https://builder.guidebook.com/open-api/v1/pagination-example/?page=2",
  "previous": null,
  "results": [
      {
        "property_1": "value-a",
        "property_2": "value-b"
      },
      {
        "property_1": "value-c",
        "property_2": "value-d"
      },

      ... etc.
  ]
}
```


If a resource supports listing itself, a data structure will be returned with several key attributes related to pagination:

Attribute Name  | Type      | Description
---------       | --------  | -------
count           | integer   | Total number of available resources
next            | string    | URL to retrieve the next page of resources
previous        | string    | URL to retrieve the previous page of resources
results         | array     | Representation of the resources in this page

`next` will be `null` if no additional resources are available (you have reached the last page).
