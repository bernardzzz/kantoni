// @flow
import grpc from 'grpc'

class Server {
  environment: string
  constructor (environment: 'dev' | 'production') {
    this.environment = environment
  }

  run (): void {
    grpc.Server()
  }
}

export default Server
