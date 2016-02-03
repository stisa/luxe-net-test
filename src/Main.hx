
import luxe.Input;
import luxe.Vector.Vec;

class Main extends luxe.Game {

  //SCRAPPED: TODO: The world should probably have its own clients, so clients wanting to connect can ask clients[0] for a connection
  //TODO: refactor and move player, world to their own class, in folder entities, also move components to components folder

  var world : World;
    override function config(config:luxe.AppConfig) {

        return config;

    } //config

    override function ready() {
      var player : luxe.Sprite = new luxe.Sprite({
        name: "sprite",
        pos: Luxe.screen.mid
      });
      trace("1- player sprite created");
      var clientC : Client = new Client({ name: "client" });
      var controllerC : Controller = new Controller({ name: "controller"});

      player.add(controllerC);
      player.add(clientC);
      trace("4- player loaded");

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
