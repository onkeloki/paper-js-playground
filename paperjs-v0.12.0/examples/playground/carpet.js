// Generated by CoffeeScript 1.10.0
var Carpet;

Carpet = (function() {
  function Carpet() {
    var i, j, k, ref, ref1, results, x, y;
    this.colors = ["#F8F8FF", "#CCE7D3", "#FEE39F", "#E69AC2", "#A6D0F9"];
    this.colors = ["#fff"];
    this.types = ["tl", "tr", "bl", "br", "", "", "", "", "", "", "", ""];
    this.minScale = 1;
    this.maxScale = 2;
    this.scales = (function() {
      results = [];
      for (var i = ref = this.minScale, ref1 = this.maxScale; ref <= ref1 ? i <= ref1 : i >= ref1; ref <= ref1 ? i++ : i--){ results.push(i); }
      return results;
    }).apply(this);
    this.strokes = [1, 2, 3];
    this.segmentSize = 40;
    for (x = j = 0; j <= 50; x = ++j) {
      for (y = k = 0; k <= 50; y = ++k) {
        this.fullSquare(x, y);
      }
    }
  }

  Carpet.prototype.getRandomFrom = function(array) {
    return array[Math.floor(Math.random() * array.length)];
  };

  Carpet.prototype.fullSquare = function(x, y) {
    x = x * this.segmentSize * 2;
    y = y * this.segmentSize * 2;
    this.triangle(0 + x, 0 + y, this.getRandomFrom(this.colors), this.getRandomFrom(this.types)).scale(this.getRandomFrom(this.scales));
    this.triangle(this.segmentSize + x, 0 + y, this.getRandomFrom(this.colors), this.getRandomFrom(this.types)).scale(this.getRandomFrom(this.scales));
    this.triangle(0 + x, this.segmentSize + y, this.getRandomFrom(this.colors), this.getRandomFrom(this.types)).scale(this.getRandomFrom(this.scales));
    return this.triangle(this.segmentSize + x, this.segmentSize + y, this.getRandomFrom(this.colors), this.getRandomFrom(this.types)).scale(this.getRandomFrom(this.scales));
  };

  Carpet.prototype.triangle = function(shiftX, shiftY, color, type) {
    var t;
    if (type === "tl") {
      t = new Path({
        segments: [[0 + shiftX, 0 + shiftY], [this.segmentSize + shiftX, 0 + shiftY], [0 + shiftX, this.segmentSize + shiftY]],
        fillColor: color
      });
    }
    if (type === "tr") {
      t = new Path({
        segments: [[0 + shiftX, 0 + shiftY], [this.segmentSize + shiftX, 0 + shiftY], [this.segmentSize + shiftX, this.segmentSize + shiftY]],
        fillColor: color
      });
    }
    if (type === "bl") {
      t = new Path({
        segments: [[0 + shiftX, 0 + shiftY], [this.segmentSize + shiftX, this.segmentSize + shiftY], [0 + shiftX, this.segmentSize + shiftY]],
        fillColor: color
      });
    }
    if (type === "br") {
      t = new Path({
        segments: [[this.segmentSize + shiftX, 0 + shiftY], [this.segmentSize + shiftX, this.segmentSize + shiftY], [0 + shiftX, this.segmentSize + shiftY]],
        fillColor: color
      });
    }
    if (!t) {
      t = new Path();
    }
    t.strokeWidth = this.getRandomFrom(this.strokes);
    t.strokeColor = "#000";
    return t;
  };

  return Carpet;

})();

new Carpet();
