
# Rails Engine Lite

An API project building off of Little Esty Shop


## Requirements

```
Ruby 2.7.4
Rails 5.2.6
```

Any gem dependency can be found in our `Gemfile`.

`HTTPie` is used later in this README during examples when calling the API, but can be substituted for `cURL` and Postman


## Setup

To begin with, clone this repository down to a location of your own choosing on your machine using `git clone`.
Move the directory to your discrecion, e.g. `var/www/engine-lite`, `/users/me/desktop`, etc...

After having cloned the directory, run the following commands within the project directory:

`
bundle install
`

This will install all gems and dependencies needed for the engine to run. Next, we need to create our databases and our tables, alongside fill our database with, well, data:

`rails db:{drop,create,migrate,seed}`

`rails db:schema:dump`

After setting these two things up, we should be able to just start (`rails s`) the server and move on to our API segment of documentation!






## Making API Calls 

Rails Engine isn't necessarily the most complex or wildly sophisticated API application to exist. There are no user authentication keys that are automated and provided, there is nothing specific that needs to be added to retrieve information.

To begin, let's start off with some simple information gathering calls (make sure your server is still running!).

When wanting to access either `Merchant` or `Item` information, the formatting for each API call is relatively the same in structure, as the shown in the following (`http` is called within terminal, it is an application known as HTTPie as earlier mentioned):

```json
Get One Merchant Information:

http :3000/api/v1/merchants/1

Results:

HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"bc1fd1230d92d0b6bb211d1985ff7fd3"
Transfer-Encoding: chunked
X-Request-Id: c34a5058-6041-4ff0-8fc9-02a8f2e7927c
X-Runtime: 0.148606

{
    "data": {
        "attributes": {
            "name": "Schroeder-Jerde"
        },
        "id": "1",
        "type": "merchant"
    }
}

```

```json
Get One Item Information:

http :3000/api/v1/items/1

Results:

HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"cd20dde1d438f6bb2141a55216931b68"
Transfer-Encoding: chunked
X-Request-Id: 98fb758f-1103-4858-94d8-4e4829616f73
X-Runtime: 0.006304

{
    "data": {
        "attributes": {
            "description": "Ducimus id perferendis. Libero ullam odit aut quisquam non. Rem eaque distinctio quos. Eaque nihil odit.",
            "merchant_id": 1,
            "name": "Item Et Cumque",
            "unit_price": 395.15
        },
        "id": "12",
        "type": "item"
    }
}

```

Failing to specify a merchant or item after its respectful directory will instead return all existing merchant/items:

```json

Retrieve all Merchants and their information:

http :3000/api/v1/merchants/

Results:

HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"4276f772a17e5bfce5308df607a044aa"
Transfer-Encoding: chunked
X-Request-Id: 2091f42b-01d3-49a1-bb80-3480f60ed675
X-Runtime: 0.006172

{
    "data": [
        {
            "attributes": {
                "name": "Schroeder-Jerde"
            },
            "id": "1",
            "type": "merchant"
        },
        {
            "attributes": {
                "name": "Klein, Rempel and Jones"
            },
            "id": "2",
            "type": "merchant"
        },

        etc...


```

All subsequent calls to either get or create information will result in a similar JSON structured response.
## API Call Examples

The following is a list of all endpoints available within the Rails Engine project (albeit, the direct call structuring and documentation doesn't exist, so these are arguably next to useless in assisting you actually call the API).

GET `:3000/api/v1/merchants`

GET `:3000/api/v1/merchants/{{merchant_id}}`

GET `:3000/api/v1/merchants/{{merchant_id}}/items` 

GET `:3000/api/v1/items`

GET `:3000/api/v1/items/{{item_id}}`

POST `:3000/api/v1/items`

PUT `:3000/api/v1/items/{{item_id}}`

GET `:3000/api/v1/items/{{item_id}}/merchant`

GET `:3000/api/v1/merchants/find?name={{name_fragment}}`

GET `:3000/api/v1/items/find_all?name={{name_fragment}}`
## 👽 About Me
Despite having the habit of speedrunning my projects for absolutely zero reason, I am, surprisingly, a _relatively_ competent Rails developer. Rails Engine is a demonstration of API Endpoint creation and their tests for functionality, both through provided Postman tests and handrolled request spec tests.

Also, here's this photo of an orange (it is also my profile photo for GitHub).

![orange](https://user-images.githubusercontent.com/77761679/161328462-51628f52-9e20-4cef-8879-522cb88bbf41.jpg)
