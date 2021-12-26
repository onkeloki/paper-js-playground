project.currentStyle = {
	fillColor: '#fff',
	strokeColor: 'black',
	strokeWidth: 1
}
class Triangle
	debugPoint: (p, color)->
		r = Path.Circle(p, 20)
		r.fillColor = color
	constructor: (@points)->
		@p1 = @points[0];
		@p2 = @points[1];
		@p3 = @points[2];

		@path = new Path
			segments: [
				@p1
				@p2
				@p3
				@p1
			]
			strokeColor: "black"
			strokeWidth: 1

	iterate: (count)->
		for depth in [0..count]
			if depth is 0
				points = @.getChildTriangle()
			else
				points = t.getChildTriangle()
			t = new Triangle(points)



	getChildTriangle: ()->
		[
			@pointOnline(@p1, @p2, 0.05)
			@pointOnline(@p2, @p3, 0.05)
			@pointOnline(@p3, @p1, 0.05)
		]

	pointOnline: (pa, pb, pos)->
		new Point(pa.x + (pb.x - pa.x) * pos, pa.y + (pb.y - pa.y) * pos);


class Carpet

	constructor: ()->
		@colors = ["#F8F8FF", "#CCE7D3", "#FEE39F", "#E69AC2", "#A6D0F9"]
		@colors = ["#fff", "red", "blue"]
		@types = ["tl","tr"]
		@minScale = 1;
		@maxScale = 1;
		@scales = [@minScale..@maxScale]
		@strokes = [1]

		@segmentSize = 200
		for x in [0..50]
			for y in [0..50]
				@fullSquare(x, y)
	getRandomFrom: (array)->
		array[Math.floor(Math.random() * array.length)]

	fullSquare: (x, y)->
		x = x * @segmentSize * 2
		y = y * @segmentSize * 2
		@triangle(0 + x, 0 + y, @getRandomFrom(@colors), @getRandomFrom(@types))
		@triangle(@segmentSize + x, 0 + y, @getRandomFrom(@colors), @getRandomFrom(@types))
		@triangle(0 + x, @segmentSize + y, @getRandomFrom(@colors), @getRandomFrom(@types))
		@triangle(@segmentSize + x, @segmentSize + y, @getRandomFrom(@colors), @getRandomFrom(@types))


	triangle: (shiftX, shiftY, color, type)->
		if type is "tl" or true
			p1 = new Point(0 + shiftX, 0 + shiftY)
			p2 = new Point(@segmentSize + shiftX, 0 + shiftY)
			p3 = new Point(0 + shiftX, @segmentSize + shiftY)
			t = new Triangle [p1, p2, p3]
			t.iterate(10)

		if type is "tr" or true
			p1 = new Point(0 + shiftX, 0 + shiftY)
			p2 = new Point(@segmentSize + shiftX, 0 + shiftY)
			p3 = new Point(@segmentSize + shiftX, @segmentSize + shiftY)
			t = new Triangle [p1, p2, p3]
			t.iterate(10)
		if type is "bl"
			p1 = new Point(0 + shiftX, 0 + shiftY)
			p2 = new Point(@segmentSize + shiftX, @segmentSize + shiftY)
			p3 = new Point(0 + shiftX, @segmentSize + shiftY)
			t = new Triangle [p1, p2, p3]
			t.iterate(10)
		if type is "br"
			p1 = new Point(@segmentSize + shiftX, 0 + shiftY)
			p2 = new Point(@segmentSize + shiftX, @segmentSize + shiftY)
			p3 = new Point(0 + shiftX, @segmentSize + shiftY)
			t = new Triangle [p1, p2, p3]
			t.iterate(10)

		t


new Carpet()