# README

This backend aims to provide a cloud-based peak shaving solution for Siemens meters and EVSEs.
Facilitating communications with the respective gateways, this backend aggregates
data from the EVSE chargers and SEM3 meters and performs real-time logic to avoid overconsumption
at peak hours. Clients can register, configure, and monitor peak shaving plans from a web interface.
Meters and chargers are registered using their respective gateways. The gateways also host redundant
logic to ensure that peak shaving occurs even if connect to this backend is dropped.

* Utilizes Rails 5 and PostgreSQL

* Uses publisher/subscriber service provided by PubNub to enable real time communications with devices

* Performs stream processing using Redis

* Front-end uses React and Bootstrap

@TODO: complete system dependencies
System Dependencies:
  -
  -

@TODO: complete installation instructions
Contributing/Installation:
  1.



@TODO: complete deployment instructions
Deployment instructions:

  1.
