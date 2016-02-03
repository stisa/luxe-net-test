import luxe.Component;
import luxe.Vector;

//This component handles communication with the client
class Client extends Component {
  var cId : String=""; //client ID
  var oldPos : Vector;
  var ip ="192.168.1.100";
  var port = 3456;

// TODO: 1- implement websocket on non-js targets
// TODO: 2- rewrite class so that ip,port can be passed on creation
#if js

  var socket : js.html.WebSocket;

  override function onadded() {

      socket = new js.html.WebSocket("ws://" + ip + ":" + port);

      // start updating only AFTER we know there is a connection
      socket.onopen = function(event:Dynamic){
          socket.send("QUERYID");
          trace("2- client queryied ID");
      }

      socket.onmessage = function(event:Dynamic){
        if(cId !="") {
          trace(event.data);
        }else{ //The first data we receive should be this client id
          cId=event.data;
          this.entity.name = this.entity.name+cId;
          var t = cast(Luxe.scene.get("nameLabel"),luxe.Text);
          t.text = "You are: "+cId;
          //trace("3- "+this.entity.name+" connected");
        }
      }


  } //ready

  public function send(data:Dynamic){
    socket.send(data);
  }


  override function update(dt:Float) {
    if (cId!="" && oldPos!=this.pos){ //only send position if  we are connected and it has changed
      // CHECK: if using fixed_step physics, update and fixed update could be out of sync?
      oldPos = this.pos;
      socket.send(""+oldPos);
      //trace(this.entity.name+" sent: "+oldPos);
    }

  } //update

#else
// other targets code goes here
#end

    override function onremoved(){
      socket.close();
    }
}
