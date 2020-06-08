# Ruby on Rails + React with Hooks  
  
This project provides a skeleton/template for Ruby on Rails + React with Hooks  
  
Versions Used:
|Component|Version  |
|--|--|
| Ruby |2.7.0  |
| Rails |6.0.3.1  |
| bcrypt|3.1.13 |
| jwt|2.2.1|

# Ruby on Rails Microservices Template

This template has a base ApplicationController, which must be inherited by any controller that tries to expose an API. You can use filter at the ApplicationController level by setting

    before_action :authorized

or you can do it for specific controllers (there are controllers or methods which may be required to provide the liveness and readiness probe for the cluster or in which the API is hosted or for the Proxy servers that is in front of the API.

 Make sure to run 

> bundle install

to install the gems dependencies.

You do not need the following file in a corporate production enironment:

 - app/controllers/dashboard_controller.rb - This file is an example to test the authorisation filter (check the conmment section of the file)
 - app/controllers/tokens_controller.rb - This is used in case you have a standalone application/API development and you wish to use the default secret key base that comes with Rails. In case of corporate environments you do not have to use this file.

In case you have a public key to decrypt the JWT token you can follow the instruction in the file app/lib/json_web_token.rb

## To do

 - Written some basic tests,  must increase the coverage.
