'use strict';

const Hapi = require('hapi');

// Create a server with a host and port
const server = new Hapi.Server();

server.connection({
  host: '0.0.0.0',
  port: 8000
});

// Add the route
server.route({
  method: 'GET',
  path:'/',
  handler: function (request, reply) {
    console.log("happiness delivered");
    reply('happiness delivered');
  }
});

// Start the server
server.start((err) => {

  if (err) {
    throw err;
  }
  console.log('Server running at:', server.info.uri);
});