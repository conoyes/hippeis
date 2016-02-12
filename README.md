# hippeis
*Server side of a home automation project written in Ruby*

The server provides a RESTful JSON API for the clients.

## API
#### /temperature
* GET: query reference and current temperature
* POST: set reference temperature

#### /lighting
* GET: query reference and current lighting
* POST: set reference lighting

#### /control
* GET: query current state of temperature control
* POST: enable/disable automatic temperature control
