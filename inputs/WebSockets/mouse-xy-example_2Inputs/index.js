var io = require('socket.io-client')
var socket = io('http://localhost:3000')
var inputsNumber = 40

// Mouse x, y coordinates over web sockets on mouse drag
// Inputs number is what Wekinator (or your ML algorithms) expects

socket.on('connect', function() {

  var isMouseDown = false
  var rawData = []
  var originX, originY

  document.onmousedown = function(e) {
    isMouseDown = true
    originX = e.clientX
    originY = e.clientY
  }

  document.onmouseup   = function() {
    isMouseDown = false
    var inputsArray = []

    // TODO: how do I deal with short gestures?
    // Ignore for now, later maybe interpolation
    if ((rawData.length * 2) < inputsNumber) {
      rawData = []
      return
    }

    // Downsample by sampling every N sample using the downsampleFactor variable
    // Move to the origin (first coordinate user clicked on)
    // Normalize to -1 1 range
    var downsampleFactor = (rawData.length*2) / inputsNumber
    var sampleIndex = 0

    for (var i=0; i<inputsNumber/2; i++) {
      var x = (rawData[Math.round(sampleIndex)].x - originX) / window.innerWidth
      var y = (rawData[Math.round(sampleIndex)].y - originY) / window.innerHeight
      inputsArray.push(x, y)
      sampleIndex += downsampleFactor
    }

    socket.emit('browser', inputsArray)
    rawData = []
    originX = 0
    originY = 0
  }
  document.onmousemove = function(e) {
    if(isMouseDown) {
      rawData.push({'x': e.clientX, 'y': e.clientY})
    }
  }
})

