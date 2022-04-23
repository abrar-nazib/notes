# Express

[expressjs.com](https://expressjs.com/)

## Setting things up

```javascript
const express = require("express");

const app = express(); // express returns this object with which all the work to be done

app.set("view engine", "template_engine_name"); 
  // for specifying which templating engine to use
  //template_engine_name = hbs
```

## Customizing express server

```javascript
//------------- Express options----------------------------------------
app.use(express.static(full_path_to_web_content_directory));
    // for setting up the root directory of the server
app.use(express.json());
    // Parses the incoming json as javascript object
```

## GET requests

```javascript
//----------Basic Version---------------------------------------------
app.get("/route/:routeParameter", async (req, res) => {
  res.status(statusCode).send(thingsToBeSent); // For setting up response status code
    // Have to send status code before sending response

  const parameter = req.params.routeParameter;
    // req.params holds all the parameters sent with the request
  const queryParameters = req.query; // holds the query parameters of a request
});

```

## POST Requests

```javascript
//-----------Normal Version -------------------
app.post("/route", (req, res)=>{
    res.status(statusCode); // Important to set status code before sending
    res.send("Data to be sent");
})
//-----------Efficient version-----------------------
app.post("/route", (req, res)=>{
    res.status(statusCode).send("Things to be sent");
})
//-----------Async-Await version --------------
```

## Patch Requests

```javascript
//-----------Patch Requests---------------------------------
app.patch("route", async (req, res) => {
  //Patch requests are used to update existing data
});

//---------- Delete Requests ------------------------------------
app.delete("route", async (req, res) => {
  //Delete requests are used to delete database entries
});

//--------------Server listen to specific port for incoming requests-----------------
app.listen(port_number, () => {
  console.log("Instructing the server to listen to port X for incoming");
});
```

## Express routers

```javascript
//----------------- Express Routers -----------------------------------------
const router = new express.Router();
  // Creates a new router object
router.get(route, (req, res) => {
  // Other http request types
  //route handler
});

app.use(router); 
  // registering router with express
  // mandatory otherwise route files won't work
```

## Express middleware

Middleware for authentication handling

```javascript
// Request header to be set like:
  // Authorization: Bearer <token>

const auth = async (req, res, next)=>{ // This function will always execute before the task is handed over to route handlers

  next(); // Will pass the control to the route handler
})
```

Adding middlewares to individual route

```javascript
const middleware = require("middlewareFile.js");
route.get("/path", middleware, async (req, res)=>{
  // Route handling code
});
```

## `req`

```javascript
req.method // The method in which the request was sent
req.path   // request path
req.header // has access to request headers
```
