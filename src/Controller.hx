import luxe.Component;
import luxe.Vector;
import luxe.Input;
import luxe.tween.Actuate;

//This component handles movement of the player
class Controller extends Component {

    override function onkeydown( e:KeyEvent ) {

        if(e.keycode == Key.key_r) {
        	trace("destroying "+this.entity.name);
            this.entity.destroy();
        }
        if(e.keycode == Key.key_w) {
          Actuate.tween(this.pos, 0.3, { y : this.pos.y -20});
            //this.pos = this.pos + new Vec(0,-10);
        }
        if(e.keycode == Key.key_a) {
            //this.pos = this.pos + new Vec(-10,0);
          Actuate.tween(this.pos, 0.3, { x : this.pos.x -20});
        }
        if(e.keycode == Key.key_s) {
            //this.pos = this.pos + new Vec(0,10);
          Actuate.tween(this.pos, 0.3, { y : this.pos.y +20});
        }
        if(e.keycode == Key.key_d) {
            //this.pos = this.pos + new Vec(10,0);
          Actuate.tween(this.pos, 0.3, { x : this.pos.x +20});
        }

    } //onkeyup

}
