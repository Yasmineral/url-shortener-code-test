# URL shortner test

## Specification

### Requirements

Without using an external database, we'd like you to create a URL shortening
service. The URLs do not need to persist between restarts, but should be
shareable between different clients while the server is running.

- There should be an endpoint that responds to `POST` with a json body
  containing a URL, which responds with a JSON repsonse of the short url and
  the orignal URL, as in the following curl example:

```
curl localhost:4000 -XPOST -d '{ "url": "http://www.farmdrop.com" }'
{ "short_url": "/abc123", "url": "http://www.farmdrop.com" }
```


- When you send a GET request to a previously returned URL, it should redirect
  to the POSTed URL, as shown in the following curl example:

```
curl -v localhost:4000/abc123
...
< HTTP/1.1 301 Moved Permanently
...
< Location: http://www.farmdrop.com
...
{ "url": "http://www.farmdrop.com" }
```

# Installation

download the repo into your Projects folder using:

```
git clone https://github.com/Yasmineral/url-shortener-code-test.git
```

change into the directory, then run:

```
bundle install
```

to install dependencies.


To run the server, type the following into your command line:
```
ruby app.rb
```

Use browser to visit the application at http://localhost:4567.

# User stories

**Submit URLs**

As a user,

So that my URLs are more manageable,

I'd like to submit a long URL & have returned a working shortened version.

**Use URLs**

```
As a user,
So that my URLs are more manageable,
I'd like to submit a long URL & have returned a working shortened version.
```

```
As a user,
So that I can keep track of all my shortened urls,
I'd like to see them displayed on a page.
```

```
As a user,
So that I can save time,
I'd like http added to the start of the URL if I forget to enter it in.
```

# Process
Originally, I wanted to implement a Javascript and JQuery solution as the requirements asked for JSON body & response handling. I was also excited to build a front end that did not require page refreshing (always a more enjoyable user experience!), but in the end, opted for a simple Ruby solution to better utilize the time available.
I concentrated on the backend functionality and tried a few different ways to get the desired results. There are some methods I would love to clean up - for example, my save_urls method is repeating functionality as I had some issues retrieving the urls from the hash unless I stored them one by one, so I know there's certainly a cleaner way of doing this! Unfortunately, I’ve also not yet managed to get the redirects to work so would love to tackle this again in the future, as well as make the program more robust with extra tests.
