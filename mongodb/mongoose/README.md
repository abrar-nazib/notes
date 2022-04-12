# Mongoose

[**Documentation**](https://mongoosejs.com/)

## Connection

```javascript
const mongoose = require('mongoose');

mongoose.connect("mongodb://127.0.0.1:27017/database-name", { optionkey : value });
  // optionkey -> useNewUrlParser: true
  // The connection url consists database-name which is slightly different than raw mongodb-driver
```

## Modeling

Creating a mongoose model: Model allows us to model something of the real world to be stored in the database.\
Mongoose is an ODM category tool which means Object Document Mapper.

```javascript
// Modeling a mongoose model
const Model = mongoose.model("ModelName", {
  // Model's name's convention is Uppercase. This will be considered as collection Name but in lower case
  // Mongoose will make a collection named modelnames in the database
  name:{
    type: String,
    required: true, // Field Required to function
    trim: true, // will perform trim operation on the data
    lowercase: true,
    minlength: true, // sets up the minimum length
  },
  age:{
    type: Number,
    default: 0,
    validate(value){    // Code for data validation
      value < 0 ? throw new Error('Error!');
    }
  }
});

// Instantiation of a mongoose model
const Hacker = new User({
  name: "Abrar",
  age: 21
});

// Data types:
// String, Boolean, Number, Date, Buffer
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
Hacker.save().then(()=>{/* Success handler code */}).catch((error)=>{/* error handler code */})
    // Save instance of user to the database
    // If successful, the model that was inserted is returned again so don't need to access it from the return again
```

## Finding/Searching data

```javascript
// Find instance in the database
Model.findOne({}).then((result)=>{/* result handler */}).catch((error)=>{/* error handler */})
    // Will return all elements

Model.find({key:"value"}).then((result)=>{/* result handler */}).catch((error)=>{/* error handler */})
    // Will return matching elements

Model.findById(_id).then((result)=>{/* result handler */}).catch((error)=>{/* error handler */})
    // Will return matching element searching by id

Model.findByIdAndUpdate(_id, {key: updatedValue}, {/*opt*/new:true, runValidators:true}).then((result)=>{/* result handler */}).catch((error)=>{/* error handler */})
    // Find by id and update accordingly
    // The optional parameter "new: true" will return the updated model instance.
    // "runValidators: true" runs the necessary validators

Model.findByIdAndDelete(_id).then((result)=>{/* result handler */}).catch((error)=>{/* error handler */})

    // Find by id and delete

Model.countDocuments({key: value}).then((result)=>{/* result handler */}).catch((error)=>{/* error handler */})
    // Counts number of documents matching filter in a database collection.
```

### Mongoose middlewares

```javascript
// Doing something before an event
schema.pre("save", async function (next) {
  // requires standard function for binding issues
  const user = this;
  if (user.isModified("password")) {
    user.password = await bcrypt.hash(user.password, 8); // Will hash the password everytime attempted to modify
  }
});

// Doing something after an event
schema.post;
```
