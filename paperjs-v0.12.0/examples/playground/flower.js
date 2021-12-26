// Generated by CoffeeScript 1.10.0
var Flower, onFrame;

Flower = (function() {
  function Flower(cou) {
    var i, j, ref;
    this.cou = cou;
    paper.project.activeLayer.removeChildren();
    this.count = 30;
    project.currentStyle = {
      fillColor: '#fff',
      strokeColor: 'black',
      strokeWidth: 2
    };
    this.rectangle = new Path.Circle(new Point(500, 500), 50).scale(0.5, 2);
    this.rotationPoint = this.rectangle.bounds.topCenter;
    for (i = j = 0, ref = this.count; 0 <= ref ? j <= ref : j >= ref; i = 0 <= ref ? ++j : --j) {
      this.createClone(360 / this.count * i);
    }
  }

  Flower.prototype.createClone = function(r) {
    var c;
    c = this.rectangle.clone();
    return c.rotate(Math.sin(r) * this.cou + r, this.rotationPoint);
  };

  return Flower;

})();

onFrame = function(event) {
  return new Flower(event.count);
};