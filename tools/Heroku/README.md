# Notes on the commands I used while using heroku

## Nodejs modification

* Nodejs package.json file must have a script named start whics defines the main run script of the project
* Heroku stores the port number inside ```process.env.PORT```
  
## Heroku CLI

* [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)
* ```heroku login``` to login with heroku account
* ```heroku keys:add``` will look for public keys in the ~/.ssh directory and will add the key in remote 
* ```heroku create unique-url-name``` in project directory will create a subdomain in the herokuapp.com domain for specified project