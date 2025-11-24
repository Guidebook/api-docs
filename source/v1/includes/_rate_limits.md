# Rate Limiting

Guidebook enforces a global rate limit across all Open API endpoints. An account is allowed 10000 requests per day. If exceeded, any further requests will return a 429 response.