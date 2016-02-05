
import luxe.Input;
import luxe.Vector.Vec;
import luxe.options.EntityOptions;
import luxe.Color;

typedef WorldOptions = {

  > EntityOptions,
  var player: luxe.Sprite;
}
// The world maintains all the other clients
class World extends luxe.Entity {
	var worldClientC : WorldClient;
  var clients: Map<String,luxe.Sprite>;
  var player : luxe.Sprite;

    override public function new(options: WorldOptions) {
      if(options.player!=null){
        player = options.player;
      }
      super(options);
      clients = new Map<String,luxe.Sprite>();
      trace("5- world created");
      worldClientC = new WorldClient({name: "worldClient"});
      this.add(worldClientC);
    }
    override function update(dt:Float){

    }

    public function addClient(cIdPos:String){ //should rename to updateclients
      var arr = cIdPos.split("///");
      var pId =player.get("client").cId;
      // id///pos///alive
      if (arr[2]=="true"){
        if ( pId!= "" && arr[0] != pId  &&  clients.get(arr[0])== null ){
          trace("new client");
          var sprite : luxe.Sprite = new luxe.Sprite({
            name: "sprite"+arr[0],
            pos: Luxe.screen.mid,
            size: new Vec(48,48),
            color: new Color(Math.random(),Math.random(),Math.random())
          });
          var sName : luxe.Text = new luxe.Text({
            pos: new Vec(10,10),
            text: arr[0],
            parent: sprite,
            point_size: 36,
            align: luxe.Text.TextAlign.center,
            color: new Color(0,0,0)
          });
          clients.set(arr[0],sprite);
        } else {
          //trace(Utilities.vectorFromString(arr[1]));
          //trace(arr[1]);
          if( clients.get(arr[0])!=null){
            clients.get(arr[0]).pos = Utilities.vectorFromString(arr[1]);
          }
        }
      } else { //Sprite is dead
        if(clients.get(arr[0])!=null){
          clients.get(arr[0]).destroy();
        }
      }


    }


}
