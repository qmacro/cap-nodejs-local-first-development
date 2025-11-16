const cds = require('@sap/cds')
const log = cds.log('receiver')

cds.once('served', async () => {
  const EmitterService = await cds.connect.to('EmitterService')
  EmitterService.on('Greeting.Received', (msg) => {
    log('-> received:', msg.event, msg.data)
  })
})
