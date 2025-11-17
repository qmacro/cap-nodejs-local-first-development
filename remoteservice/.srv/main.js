const cds = require('@sap/cds')
module.exports = cds.service.impl(async function() {

  const northbreeze = await cds.connect.to('northbreeze')
  this.on('READ', 'Products', async (req) => {
    return await northbreeze.run(req.query)
  })

})
