# Broken Access Control Vulnerability

## Vertical access controls

* Different type of user gets different functionality
* Admin-User access control mechanism

## Horizontal access control

* Access to a subset of same functionality
* User-User access control mechanism

## Context dependant access control

* Workflow dependant access control
* Limiting access not to modify shopping cart after payment

## Multi step Process Related Access control vulnerability

## How to look for this

* Look for role, admin, priv related parameters and fuzz them

## Rough Techniques

* Try to override url with X-Original-URL or X-Rewrite-URL
* Change the request method -> maybe $_REQUEST["Param"] is used
* Whatever happens! must fuzz the userid determined params and see responses
