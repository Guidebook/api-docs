# Timezones + UTC

## Communicating With the Open API

Internally, Guidebook's servers store all inputted datetime values in the [Universal Time Zone (UTC)](https://en.wikipedia.org/wiki/Coordinated_Universal_Time). As such, when the Guidebook Open API reports a datetime, it returns a datetime value in UTC. For example, `Session.start_time`, `Session.end_time`, and `Guide.created_at` all report themselves in UTC. To minimize confusion and error, we recommend that your applications send datetimes to the Guidebook Open API in UTC. For example, `2017-09-26T09:35:00.000000-0700` ("September 26th 2017 9:35AM US/Pacific") would be sent as `2017-09-26T16:35:00.000000+0000` ("September 26th 2017 4:35PM UTC").

## Display in Guidebook's Mobile Apps

When datetimes (like `Session.start_time` and `Session.end_time`) are displayed to users in Guidebook's Android + iOS mobile apps, they are converted from UTC to the timezone of the `Guide` object they belong to. As of now, `Guide` timezone management is available in the [Guidebook Builder CMS](https://builder.guidebook.com) (and not via the Open API).
