// @flow
import Server from './server'

const main = async () => {
  const server = new Server('dev')
  server.run()
}

main()
