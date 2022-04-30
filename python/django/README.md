# Notes on django course

## Getting started

- `pip install django` installs django in the environment
- `django-admin` shows sub commands available for django
- `django-admin startproject project_name` creates a project folder with the specified name.
- `python manage.py runserver` to start running server in default port 8000.
- `python manage.py startapp appname` to create a new app for the website.
  - After adding an app, have to add it into root directory's settings.py `appname.apps.AppConfig` in installed apps

## Working with views

- Code in views.py file.

```python
from django.shortcuts import render
from django.http import HttpResponse

def pathHandler(request):
    # Function to handle respnose
```

## Working with urls

- Code in urls.py file.

```python
from django.urls import path, include
from directoryPath import customViewFile

urlpatterns = [
    path('pathToHandle/', costomViewFile.routeHandlerFunction, name="Page-name"),
    path('pathtoHandle/', include("filename.urls")), # for handing over request to other app/route-handler
]
```

## Templates

- Have to store templates of an app inside `/templates/appname`
- Have to add appname into project's settings.py `INSATLLED_APPS` as `appname.apps.AppnameConfig`.
- Have to render the template from views. The path is relative to the base `templates` directory

```python
context = {
    'variable' : 'data'
}
def route(request):
    return(render(request, 'appname/file.html'), context)
        # render function still returns an http response in the background.
        # third argument allows data passage between template and view file
```

**Inside the template folder:**

- putting variables: `{{ variable }}`
- putting functional codes `{% code %}`
- `if`s need `endif` and `for`s need `endfor`

```django
{% for post in posts %}
<h1>{{ post.title }}</h1>
<p>{{ post.author }} on {{ post.date_posted }}</p>
<p>{{ post.content }}</p>
{% endfor %}
```

**Inheriting other templates:**

Code inside base template

```django
{% block content %} {% endblock %}
```

Code inside template where base template is being inherited

```django
{% extends 'appname/baseTemplate.html' %}
{% block content %}
    # custom code to run {overrides the block content}
{% endblock content %}
```

## Static files

- Static files have to be placed inside `appFolder/static/appFolder/` directory
- Static files has to be linked like this `{% static appName/file.ext %}`

## URLs

- Dynamic urls should be put like this, `{% url 'url-name' %}` from urls.py

## Migrations

- `python manage.py makemigrations` have to do it after every database change is done. EG. New Table.
- `python manage.py migrate` Migrate to databases
- `python manage.py createsuperuser` To create super user. {testing321}

## Database

- `python manage.py sqlmigrate appname N` to check the sql code being used to create models
- ORM = Object Relational Mapper

**Modeling:**

- Code inside models.py
- Each model maps to a single table in the database
- Each attribute of the model represents a database field

```python
from django.db import models
from django.utils import timezone # timezone needed for using timezone.now property

class Post(model.Model):  # class post inherits from model.Models
    # Each class will be a table in the database
    # Each attribute will be a different field in the database

    title = models.CharField(max_length=100)
    # title is a character field with max length of 100
    content = models.TextField()    # Text fields don't have any size limit

    date_posted = models.DateTimeField(default=timezone.now)
    # default=timezone.now for setting the creation time but could be mutated

    author = models.ForeignKey(User, on_delete=models.CASCADE)
    # on_delete CASCADE means posts will get deleted associated to the user if author-User is deleted.
    # One to many relationship
```

- `makemigrateions` `migrate` after every database change is necessary.
- `python migrate.py sqlmigrate migration_number` Prints the sql code needed to run to create the migration

**Querying tables:**

```python
from django.contrib.auth.models import User

User.objects.all() # returns all user objects
User.objects.first() # returns the first user of the list
User.objects.filter(field='value') # to filter out the result according to the value, But it's possible that it could return multiple results
user = User.objects.filter(field='value').first() # will return the first result of the filtered results
user = User.objects.get(id) # to get user by id

# --------------- Attributes of user
user.id
user.pk
    # pk for primary key ->
user.post_set # shows the posts the specified user created
user.post_set.create(key=value, key=value)
    # creates a post and makes the user the author. Don't need to create it in a different way
```

**Creating new object:**

```python
post_1 = Post(title='Blog 1', content='Post Content', author=user)  # here user is the foreign key
    # But this code does not save the object inside database
    # author=user could be replaced with author_id=user.id as well
post_1.save() to save the post
```

**Registering new object inside admin panel:**

```python
from .models import Model

admin.site.register(Model)
```

## Shell

- `python manage.py shell` spawns a python shell

## Django Date and Time

```python
{% timevariable|date:"F d, Y" %} # Here, F=Month in full form, d=date in normal numeric form, Y=Year in normal form
```

## User registration

```python
from django.contrib.auth.forms import UserCreationForm
```
