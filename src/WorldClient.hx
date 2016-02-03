import luxe.Component;
import luxe.Vector;

//This component handles communication with the world
class WorldClient extends Component {
  var ip ="192.168.1.100";
  var port = 3456;

// TODO: 1- implement websocket on non-js targets
// TODO: 2- rewrite class so that ip,port can be passed on creation
// TODO: 3- onsocketclose should notify worlds and corresponding client should be deleted

#if js

  var socket : js.html.WebSocket;
  var open: Bool = false;
  override function onadded() {

      socket = new js.html.WebSocket("ws://" + ip + ":" + port);
      
      // start updating only AFTER we know there is a connection
      socket.onopen = function(event:Dynamic){
        trace("6- worldSocket open");
        open = true;
      }

      socket.onmessage = function(event:Dynamic){
        cast(this.entity,World).addClient(event.data);
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
