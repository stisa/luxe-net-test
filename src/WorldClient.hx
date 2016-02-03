import luxe.Component;
import luxe.Vector;

//This component handles communication with the client
class WorldClient extends Component {
  var ip ="192.168.1.100";
  var port = 3456;

// TODO: 1- implement websocket on non-js targets
// TODO: 2- rewrite class so that ip,port can be passed on creation
// TODO: 3- onsocketclose should notify worlds and corresponding client should be deleted
// IDEA: the clients could be dumb, just like controllers, and a server written in haxe can display the characters
// ... or maybe the clients gets a limited view while the server gets a complete view with all clients moving
#if js

  var socket : js.html.WebSocket;
  var open: Bool = false;
  override function onadded() {

      socket = new js.html.WebSocket("ws://" + ip + ":" + port);

      // start updating only AFTER we know there is a connection
      socket.onopen = function(event:Dynamic){
        trace("6- worldSocket open");
        open = true;
          //socket.send("WORLDQUERY");
          //cId = "conn";
      }

      socket.onmessage = function(event:Dynamic){
        //if (cId!=null) {
          //trace(event.data);
          //trace("7- worldSocket want to addClient "+event.data);
          cast(this.entity,World).addClient(event.data);
        //} else {
        //  cId = event.data;
        //}
      }

  } //ready

  public function send(data:Dynamic){
    socket.send(data);
  }


  override function update(dt:Float) {
      if (open) send("WORLDUPDATE");
  } //update

#else
// other targets code goes here
#end
    override function onremoved(){
      socket.close();
    }
}
