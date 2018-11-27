// @flow
const grpc = require('grpc')

/**
 * gRPC server
 */
class Server {
  environment: string
  server: any
  constructor (environment: 'dev' | 'production') {
    this.environment = environment
  }

  run (): void {
    console.log('fired')
    this.server = grpc.Server()
    console.log(this.server)
    this.server.start()
  }
}

module.exports = Server
