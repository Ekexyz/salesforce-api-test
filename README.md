Salesforce API starter
==================

Salesforce specific sample suite to demonstrate the use of API's.


Overview
--------

This repository provides an example how to work with Salesforce cloud APIs.
It's meant to be used as a template for Salesforce API testing projects.


Usage
-----
* Add your client_id to CRT variable "sf_api_key"
* Add your client_secret to CRT variable "sf_api_secret"
* Add your Salesforce user to CRT variable "username"
* Add your Salesforce user password to CRT variable "password"
  * remember to select hidden to encrypt the variables in CRT.

Variables can be added by hovering on top of your test suite, selecting
"Suite details" icon and adding them using "+Variable" button.

Use these automated test cases as a basis to learn and start modifying
them to suit your specific needs.


Additional information
----------------------

Directory structure:

* Tests are under "tests" folder
* Supporting files are under "resources" folder
  * Salesforce specific helpers are in file ./resources/common_api.robot
* Preprocess script in repository root to install requests library if not available in Copado Robotic Testing already.

* https://eu-robotic.copado.com
