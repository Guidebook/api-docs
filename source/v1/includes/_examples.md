# Example Implementations

Our [public github repo](https://github.com/Guidebook/) contains several source code samples of how to integrate Guidebook with other services.  These are provided as an additional resource to assist developers in learning about the possiblities enabled with our API.  Clients are welcome to use these examples as a starting point to create their own custom integrations.

## Eventbrite Integration
Our [Eventbrite Integration](https://github.com/Guidebook/guidebook-eventbrite-integration) is the open sourced code of how the default Eventbrite integration in [Guidebook Builder](https://builder.guidebook.com/) runs.  The standard integration imports Attendees from Eventbrite and groups them by Ticket Type.  If you would like to run your own custom Eventbrite integration, you can use this code as a starting point.

## Icalendar Integration
Icalendar is a popular format for representing schedules.  The [Icalendar Integration](https://github.com/Guidebook/guidebook-ical-integration) example we provide shows how you can import session data into Guidebook from an ical source.  Icalendar feeds can be incredibly complicated and if your ical feed incorporates non standard properties (X-prefixed properties), you can customize our ical integration to fit your needs.

## Zenefits Integration
Our [Zenefits Integration](https://github.com/Guidebook/guidebook-zenefits-integration) example shows how you can import custom list item data into Guidebook from a Zenefits HR account. Zenefits holds a lot of information about a company and its employees, and you can customize this integration
to import information relevant to your custom list and Guide.

## Google Drive Integration
Our [Google Drive Integration](https://github.com/Guidebook/guidebook-googledrive-integration) example shows how you can sync PDFs between Google Drive and Guidebook in real time.  This integration watches a specified folder in Google Drive to track changes and create, update, or delete the related PDFs in Guidebook linked to custom list items.