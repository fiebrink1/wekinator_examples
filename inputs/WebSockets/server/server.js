var io = require('socket.io')()
var osc = require('osc-min')
var dgram = require('dgram')

var remoteIp = '127.0.0.1'
var remotePort = 6448

var udpServer = dgram.createSocket('udp4')

// Get xy coordinates from browser, create an OSC message and send to Wekinator
io.on('connection', (socket) => {
  console.log('user connected')

  socket.on('browser', (data) => {

    console.log(data)

    var args = []

    data.forEach(function (element) {
      args.push({
        type: 'float',
        value: parseFloat(element) || 0
      })
    })

    var oscMsg = osc.toBuffer({
      oscType: 'message',
      address: '/wek/inputs',
      args: args
    })

    udpServer.send(oscMsg, 0, oscMsg.length, remotePort, remoteIp)
    console.log('OSC message sent to ' + remoteIp + ':' + remotePort)

  })
})

io.listen(3000)
console.log('socket listening on port 3000')
