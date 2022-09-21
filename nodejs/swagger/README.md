# Swagger

## Installation

```bash
npm install swagger-jsdoc
npm install swagger-ui-express
```

## Setup

```javascript
const swaggerJsDoc = require("swagger-jsdoc");
const swaggerUI = require("swagger-ui-express");
```

```javascript
const swaggerOptions = {
  swaggerDefinition: {
    info: {
      title: "Customer API",
      description: "Customer API Information",
      contact: {
        name: "Abrar",
      },
      servers: ["localhost:5000"],
    },
  },
  // ['.routes/*.js']
  apis: ["app.js"],
};

const swaggerDocs = swaggerJsDoc(swaggerOptions);

app.use("/api-docs", swaggerUi.serve, swaggerUi.setup(swaggerDocs));
```

From Another Tutorial, the options object

```javascript
const options = {
  definition: {
    openapi: "3.0.0", //The version of the API being used
    info: {
      title: "API Title",
      version: "1.0.0",
      description: "API Description Goes Here",
    },
    servers: [{ url: "http://server-url:port" }],
  },
  apis: ["routes/*.js"],
};

const specs = swaggerJsDoc(options); // Initialize teh swaggerjsdocs with the options
app.use("/api-docs", swaggerUI.serve, swaggerUI.setup(specs)))
```

## Basic Syntax for comment

```javascript
/**
 * @swagger
 * /customers:
 *  get:
 *      description: Use to request all customers
 *      responses:
 *        '200':
 *              description: A successful Response
 */
```

## Schema Definition

```javascript
/**
 * @swagger
 * tags:
 *  name: Books
 *  description: Books Definition API
 */

/**
 * @swagger
 * components:
 *  schemas:
 *    Book:
 *      type: object
 *      required:
 *        - title
 *        - author
 *      properties:
 *        id:
 *          type: string
 *          description: Book Id
 *        title:
 *          type: string
 *          description: Book title
 *        author:
 *          type: string
 *          description: Name of the author of the book
 *      example:
 *          id: lskdf
 *          title: kasdf
 *          author: kdlsjf
 */
```

## Defining Routes with Get Request

```javascript
/**
 * @swagger
 * /books:                                                      //# Have to include full path
 *  get:
 *    summary: Returns list of all books
 *    tags: [Books]
 *    responses:
 *      200:
 *        description: The List of the books
 *        content:
 *          application/json:
 *            schema:
 *              type: array
 *              items:
 *                $ref: '#/components/schemas/Book'
 *
 */
router.get("/", (req, res) => {
  const books = db.get("books");
  res.send(books);
});
```

**With Specified Parameter**

```javascript
/**
 * @swagger
 * /books/{id}:                          # For defining parameters
 *  get:
 *    summary: Returns book associated with id
 *    tags: [Books]
 *    parameters:
 *      - in: path
 *          name: id
 *          schema:
 *            type: string
 *          required: true
 *          description: The book id
 *    responses:
 *      200:
 *        description: The book description by id
 *        contents:
 *          application/json:
 *            schema:
 *              $ref: '#/components/schemas/Book'
 *      404:
 *        description: The book was not found
 */
router.get("/:id", (req, res) => {
  const book = db.get("books").find({ id: req.params.id }).value();
  if (!book) res.status(404).send();
  res.send(book);
});
```

## Defining Routes with POST Request

```javascript
/**
 * @swagger
 * /books:                            # For defining parameters
 *  post:
 *    summary: Create a new book
 *    tags: [Books]
 *    requestBody:
 *      required: true
 *      content:
 *        application/json:
 *          schema:
 *            $ref: '#/components/schemas/Book'
 *    responses:
 *      200:
 *        description: The book was successfully created
 *        contents:
 *          application/json:
 *            schema:
 *              $ref: '#/components/schemas/Book'
 *      500:
 *        description: Some Server Error
 */
router.post("/"(req, res)=>{
  try{
    const book = {
      id = randomIdGenerator(),
      ...req.body,
    }

    db.get("books").add(book)
  }catch(error){
    res.status(500).send(error);
  }
  res.send(book);
})

```
