class Utilities {
  public static function vectorFromString(s:String){
    var r = ~/{ x:([0-9]+), y:([0-9]+), z:([0-9]+) }/i;
    r.match(s);
    var tVec = new luxe.Vector.Vec(Std.parseFloat(r.matched(1)) ,Std.parseFloat(r.matched(2)), Std.parseFloat(r.matched(3)) );
    return tVec;
  }
}
