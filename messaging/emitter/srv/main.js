const cds = require('@sap/cds')
const log = cds.log('emitter')

module.exports = cds.service.impl(async function() {
  this.on('greet', async (req) => {
    log(`emitting Greeting.Received (${req.data.greeting})`)
    await this.emit('Greeting.Received', { info: req.data.greeting })
    return 'OK'
  })
})
