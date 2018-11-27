// @flow
const Server = require('./server')

const main = async () => {
  const server = new Server('dev')
  await server.run()
}

main()
