
import luxe.Input;
import luxe.Color;
import luxe.Vector.Vec;

class Main extends luxe.Game {

  //SCRAPPED: TODO: The world should probably have its own clients, so clients wanting to connect can ask clients[0] for a connection
  //TODO: refactor and move player, world to their own class, in folder entities, also move components to components folder

  var world : World;
  var nameLabel : luxe.Text;

    override function config(config:luxe.AppConfig) {

        return config;

    } //config

    override function ready() {
      var player : luxe.Sprite = new luxe.Sprite({
        name: "sprite",
        size: new Vec(48,48),
        pos: Luxe.screen.mid,
        color: new Color(Math.random(),Math.random(),Math.random())

      });

      trace("1- player sprite created");
      var clientC : Client = new Client({ name: "client" });
      var controllerC : Controller = new Controller({ name: "controller"});

      player.add(controllerC);
      player.add(clientC);
      trace("4- player loaded");

      nameLabel = new luxe.Text({
        name: "nameLabel",
        pos: new Vec(48,48),
        text: "player name",
        point_size: 36,
        align: luxe.Text.TextAlign.left,
        color: new Color(1,1,1)
      });

      world = new World({name: "world", player : player});
      trace("8- world loaded");
    } //ready

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update(dt:Float) {

    } //update


} //Main
