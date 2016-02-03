var WebSocketServer = require('ws').Server;

var host = '192.168.1.100';
var port = 3456; // Port we want to spin up our server on.
var clients = [];

var wss = new WebSocketServer({ host: host, port: port });

/*----
 DONE ~TODO: find a way to encode a client name (possibly unique) and keep a reference of it, allowing targeted responses~
 TODO: speed up the response, possibly by using byteArrays
 TODO: store pos in the ws object?
----*/

console.log("Server up at "+host +":"+port);

wss.on('connection', function connection(ws) {

  ws.on('message', function incoming(message) {
  	if(message === "QUERYID"){
  		ws.id = 0+clients.length; // client id is handled server side. id 0 should be the world
      ws.alive = true;
  		clients.push(ws);
  		ws.send(ws.id.toString());
      console.log("ws.id: "+ ws.id);
    }else if(message === "WORLDQUERY"){

  	}else if(message === "WORLDUPDATE"){
  		//console.log("WORLDUPDATE");
  		clients.forEach( function sendClient (client) {
        ws.send(client.id+"///"+client.pos+"///"+client.alive);
  		});

  	}else {
  		//console.log('received: %s from %s', message, ws.id);
  		clients[ws.id].pos = message;
  	}

  });
  ws.on('close', function closing(connection) {
    if(clients[ws.id]!=null){
      clients[ws.id].alive = false;
      console.log('closing: %s', ws.id);
    }
  });

});
