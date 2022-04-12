# Express

[expressjs.com](https://expressjs.com/)

## Setting things up

```javascript
const express = require("express");

const app = express(); // express returns this object with which all the work to be done

//------------- General app syntax -----------------
app.set(name, value);
//-----------------

app.set("view engine", "template_engine_name"); //template_engine_name = hbs

// for specifying which templating engine to use
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
//----------Get Requests---------------------------------------------
app.get("/route/:routeParameter", async (req, res) => {
  res.status(statusCode); // For setting up response status code
  // Have to send status code before sending response

  res.render("filename_without_extension_inside_views_folder", {
    object_with_key_value_pair,
  });
  //for rendering dynamic html file from any templating engine
  //need to use some variables inside the template. The object passed stores the needed variables
  res.send("Things to pass as response to the request"); // For sending text as response

  const request_query = req.query; // req.query contains the get-request objects
  const request_parameters = req.params; // req.params contain route parameters
});
```

## POST request

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

//----------------- Express Routers -----------------------------------------
const router = new express.Router();

router.get(route, (req, res) => {
  // Other http request types
  //route handler
});

app.use(router); // mandatory otherwise route files won't work
```
