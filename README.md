# hippeis
*Server side of a home automation project written in Ruby*

The server provides a RESTful JSON API for the clients.

## API
#### /temperature
###### /reference
* GET: query reference temperature
* POST: set reference temperature

###### /current
* GET: query current temperature

#### /lighting
###### /reference
* GET: query reference lighting
* POST: set reference lighting

###### /current
* GET: query current outside lighting in LUX

#### /control
* GET: query current state of temperature control
* POST: enable/disable automatic temperature control
