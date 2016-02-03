import luxe.Component;
import luxe.Vector;
import luxe.Input;

//This component handles movement of the player
class Controller extends Component {

    override function onkeydown( e:KeyEvent ) {

        if(e.keycode == Key.key_r) {
        	trace("destroying "+this.entity.name);
            this.entity.destroy();
        }
        if(e.keycode == Key.key_w) {
            this.pos = this.pos + new Vec(0,-10);
        }
        if(e.keycode == Key.key_a) {
            this.pos = this.pos + new Vec(-10,0);
        }
        if(e.keycode == Key.key_s) {
            this.pos = this.pos + new Vec(0,10);
        }
        if(e.keycode == Key.key_d) {
            this.pos = this.pos + new Vec(10,0);
        }
    } //onkeyup

}
