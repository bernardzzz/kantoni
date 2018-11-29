// @flow
const grpc = require('grpc')
const processFn = require('../lang/nodejs/helloworld')
const service = require('../stub/helloworld_grpc_pb')

/**
 * gRPC server
 */
class Server {
  environment: string
  server: any
  constructor (environment: 'dev' | 'production') {
    this.environment = environment
    this.server = new grpc.Server()
    this.server.addService(service.GreeterService, { sayHello: processFn })
    this.server.bind('0.0.0.0:50051', grpc.ServerCredentials.createInsecure())
  }
  run (): void {
    this.server.start()
  }
}

module.exports = Server
