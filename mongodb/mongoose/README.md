# Mongoose

[**Documentation**](https://mongoosejs.com/)

## Connection

```javascript
const mongoose = require("mongoose");

mongoose.connect("mongodb://127.0.0.1:27017/database-name", {
  optionkey: value,
});
// optionkey -> useNewUrlParser: true
// The connection url consists database-name which is slightly different than raw mongodb-driver
```

## Modeling

- Creating a mongoose model: Model allows us to model something of the real world to be stored in the database.
- Mongoose is an ODM category tool which means Object Document Mapper.
- Mongoose creates a schema from the passed object. This schema could be created separately as well.

```javascript
// Modeling a mongoose model
 const modelSchema = new mongoose.Schema({
  // Model's name's convention is Uppercase. This will be considered as collection Name but in lower case
  // Mongoose will make a collection named modelnames in the database
  username:{
    type: String,
    required: true, // Field Required to function
    unique: true,   // usernames should be unique
    trim: true,     // will perform trim operation on the data
    lowercase: true,
    minlength: true, // sets up the minimum length
  },
  age:{
    type: Number,
    default: 0,
    validate(value){    // Code for data validation
      value < 0 ? throw new Error('Error!');
    }
  },
  tokens: [ // For multiple element with same type
    {
      token: {  // Property/Field name of single element
        type: String, // Characteristics of token
        required: true,
      },
    },
  ],
  userid:{
    type: mongoose.Schema.Types.ObjectId, // For storing mongoose objects
    ref: "ModelName" // for referencing to the relationed model
  }
},
//---------------- Second Argument for timestamp and update--------------------
{
  timestamps: true, // will add two additional fields: When created and when last updated
}

);

const Model = mongoose.model("ModelName", modelSchema);

// Instantiation of a mongoose model
const Hacker = new User({
  name: "Abrar",
  age: 21
});

// Data types:
// String, Boolean, Number, Date, Buffer
//
```

Using mongoose schema

```javascript
const modelSchema = new mongoose.Schema({
  // fields like the first example
  // Could incorporate middlewares as well
});
const Model = mongoose.model("ModelName", modelSchema);
```

Adding custom functions in schema

```javascript
modelSchema.statics.customFunction; // Will be able to call the customfunction with Model.customFunction()
modelSchema.methods.customFunction; // will be able to call the customFunction with modelObject.customFunction()
//standard function if this needs to be accessed
```

## Data validation and sanitization

[Docs on validation](https://mongoosejs.com/docs/validation.html)
[npm validator for advanced validation](https://www.npmjs.com/package/validator)
[mongoose schematypes](https://mongoosejs.com/docs/schematypes.html)

```javascript
//------- Everything has to be inside Model definition ----------
required: true  // for making the property mandatory
default: defaultValue // for setting up a default value
trim: true // for trimming the tariling and ending whitespaces
lowercase: true // for running toLowercase on the
minlength: 7 // minimum input length has to be 7
validate(value){
    if(rejectionCondition)
        throw new Error(errormessage);
}
```

## Saving/inserting instances of models

```javascript
Hacker.save()
  .then(() => {
    /* Success handler code */
  })
  .catch((error) => {
    /* error handler code */
  });
// Save instance of user to the database
// If successful, the model that was inserted is returned again so don't need to access it from the return again
```

## Finding/Searching data, Counting

[Documentation of find](https://mongoosejs.com/docs/api.html#model_Model.find)

```javascript
// Find instance in the database
Model.findOne({})
  .then((result) => {
    /* result handler */
  })
  .catch((error) => {
    /* error handler */
  });
// Will return all elements

Model.find({ key: "value" })
  .then((result) => {
    /* result handler */
  })
  .catch((error) => {
    /* error handler */
  });
// Will return matching elements

MyModel.find({ name: "john", age: { $gte: 18 } })
  .then((result) => {
    /* result handler*/
  })
  .catch((error) => {
    /* error handler */
  });
// Will find matching elements where age is greather than or equal to 18

Model.findById(_id)
  .then((result) => {
    /* result handler */
  })
  .catch((error) => {
    /* error handler */
  });
// Will return matching element searching by id
// Will return empty object if no match found. Won't return error, So we'll need to handle that

Model.countDocuments({ key: value }).then; //.....
// Will return the number of documents matching specified criteria
```

## Updating data

- [findByIdAndUpdate documentation](https://mongoosejs.com/docs/api.html#model_Model.findByIdAndUpdate)
- findbyIdandUpdate bypasses mongoose middlewares and does a direct operation.

```javascript
Model.findByIdAndUpdate(
  _id,
  { key: updatedValue },
  { /*opt*/ new: true, runValidators: true }
)
  .then((result) => {
    /* result handler */
  })
  .catch((error) => {
    /* error handler */
  });
// Find by id and update accordingly
// The optional parameter "new: true" will return the updated model instance.
// "runValidators: true" runs the necessary validators
await Model.findbyIdAndUpdate(
  _id,
  { key: updatedValue },
  {
    /*options*/
  }
);
// for using with async-await keyword
```

Method to use if middlewares are needed

```javascript
const requestedUpdates = {
  key1: value1,
  key2: value2,
};
const model = await Model.findById(_id);
requestedUpdates.forEach((requestedUpdateKey) => {
  model[requestedUpdateKey] = requestedUpdates[requestedUpdateKyes];
});
model.save();
```

## Deleting data

```javascript
Model.findByIdAndDelete(_id)
  .then((result) => {
    /* result handler */
  })
  .catch((error) => {
    /* error handler */
  });

// Find by id and delete

await Model.deleteMany({
  /* identification criteria*/
});

Model.countDocuments({ key: value })
  .then((result) => {
    /* result handler */
  })
  .catch((error) => {
    /* error handler */
  });
// Counts number of documents matching filter in a database collection.

model.remove(); // removes the model
```

## Mongoose middlewares

- Middlewares are used to customize the behavior of mongoose models.
- Middlewares allow to register functions to run before or after a given event.

```javascript
schemaObject.pre("save", async function (next) {
  // Run a function just before a model is saved
  // Doing something before an event->pre {post for trigerring function after a certain event }
  // requires standard function for binding issues, arrow functions does not bind things
  // about the argument next, is for confirming we're done with the function after all asynchronus stuffs
  const user = this; // this gives us access to individual users that are about to be saved. We're accessing objects here.
  if (user.isModified("password")) {
    // if the object
    user.password = await bcrypt.hash(user.password, 8); // Will hash the password everytime attempted to modify
  }

  next();
});

schemaObject.pre("remove", async function (next) {
  // function to do something exactly before deleting an object
  // as usual code
});
```

## Database Relations

Model A and Model B schema where model B creates a connection with model A

```javascript
const modelAschema = new mongoose.Schema({
  field1: {
    type: Datatype,
    required: bool,
  },
});

const modelBschema = new mongoose.Schema({
  field1: {
    type: Datatype,
    required: bool,
  },
  relationMakingField: {
    type: mongoose.Schema.Types.ObjectId, // will link the object id of the ModelA
    reqired: true, // not quite sure if it's mandatory to be required or not
    ref: "ModelA", // reference to model A
    // The ref option is what tells Mongoose which model to use during population
  },
});

const ModelA = mongoose.model("ModelA", modelAschema);
const ModelB = mongoose.model("ModelB", modelBschema);
```

Getting ModelA data from ModelB

```javascript
modelBobject = // Mongoose method to get model
  modelBobject.populate("relationMakingField");
console.log(modelBobject.relationMakingField); // normally returned the field itself but now will fetch full modelA object connected to this field
```

Getting ModelB data from ModelA: **Virtual Funcion**

```javascript
modelAschema.virtual("relationName", {
  ref: "ModelB",
  localField: "_id",
  foreignField: "relationMakingField",
  // _id in ModelA is equal to relationMakingField in ModelB
});
```

For getting data, use populate method.

### Advanced `populate`

**Using filters inside populate:**

```javascript
await model.populate("field"); //normal usage to populate everything:

await model.pupulate({
  path: "fieldname",
  match: {
    key: value, // Search Criteria
  },
  options: {
    // Option for pagination and sorting
    limit: 2, // Limits returned results to 2
    skip: 10, // Ignore the first 10 results of the returned result and start from 11th result.
    sort:{  // for sorting retrieved data
      fieldName: N // if N=1, ascending. N=-1 for descending
    }
  },
});
```
