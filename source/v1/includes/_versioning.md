# Versioning

New versions of the Guidebook Open API will be released when Guidebook makes backwards incompatible changes to how resources are manipulated or represented. New versions of the Guidebook Open API will include new urls for accessing resources; for example in `v1` ("version 1") `Session` objects are accessed at `https://builder.guidebook.com/open-api/v1/sessions/`, but in v2 `Session` objects *might* be accessed at a url like `https://builder.guidebook.com/open-api/v2/sessions/`.

Guidebook reserves the right, however, to make backwards-compatible changes to the Open API **without** releasing a new Open API version. Here are some examples of backwards-compatible changes:

- Adding additional Open API resources
- Adding optional request parameters to existing routes
- Adding new properties to existing responses
- Changing the order of properties in existing API responses
- Changing the length or format of object IDs or other opaque strings.
