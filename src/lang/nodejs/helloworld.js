'use strict'
const message = require('../../stub/helloworld_pb')
const helloWorld = (call, callback) => {
  var reply = new messages.HelloReply();
  reply.setMessage('Hello ' + call.request.getName());
  callback(null, reply);
}

module.exports = helloWorld
