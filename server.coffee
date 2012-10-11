io = require("socket.io").listen(3000)
io.set('log level', 3)

io.sockets.on "connection", (socket) ->
  console.log("#{socket.id} connected!")
  
  # add points
  start = [250, 500, 750]
  
  setInterval (->
    start = (num + 50 for num in start)
    
    socket.emit('addPoint', start)
  ), 2000