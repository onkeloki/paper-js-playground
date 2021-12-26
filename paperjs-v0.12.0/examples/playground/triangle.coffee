class Triangle
	constructor: (@points, @startColor)->
		@iterations = []
		@direction = "cw"
		@startColor = "#c0c0c0" if not @startColor
		@p1 = @points[0];
		@p2 = @points[1];
		@p3 = @points[2];
		@draw()



	clearAll: ()->
		for t in @iterations
			t.path.clear()
		@iterations = []

	getPath: ()->
		@path
	draw: ()->
		@path.clear() if @path
		@path = new Path
			segments: [@p1, @p2, @p3, @p1]
		@path.fillColor = @startColor
		@path.strokeColor = "#fff"
		@path.strokeWidth = 0

	iterate: (count, endColor)->
		@clearAll()
		if endColor
			@endColor = endColor
		first = false;
		for depth in [1..count]
			if not first
				points = @.getChildTriangle()
				first = true
			else
				points = t.getChildTriangle()
			t = new Triangle(points)
			@iterations.push(t)
			t.path.fillColor = @startColor
			if @endColor
				percdone = depth / count
				t.path.fillColor = blend_colors(@startColor, @endColor, percdone)
		@


	getChildTriangle: ()->
		speed = 0.05
		[
			@pointOnline(@p1, @p2, speed)
			@pointOnline(@p2, @p3, speed)
			@pointOnline(@p3, @p1, speed)
		]

	pointOnline: (pa, pb, pos)->
		new Point(pa.x + (pb.x - pa.x) * pos, pa.y + (pb.y - pa.y) * pos);


it = 20
ra = new Path.Rectangle(new Point(0, 0), new Size(window.innerWidth, window.innerHeight))
ra.fillColor = "#000"
b = ra.bounds

#
window.x = new Triangle([b.bottomRight, b.topCenter, b.bottomLeft], "#000").iterate(it, "#00ff00")
window.y = new Triangle([b.topLeft, b.topCenter, b.bottomLeft], "#000").iterate(it, "#00ffff")
window.z = new Triangle([b.topCenter, b.topRight, b.bottomRight], "#000").iterate(it, "#ffff00")

add = ()=>

	it++
	window.x.iterate(it)
	window.y.iterate(it)
	window.z.iterate(it)
#setInterval(add, 10)
#t = new Triangle([b.topLeft, b.topCenter, b.leftCenter], "#000").iterate(it, "#00ff00")
#t = new Triangle([b.topCenter, b.bottomRight, b.leftCenter], "#000").iterate(it, "#00ff00")
#t = new Triangle([b.leftCenter, b.bottomRight, b.bottomLeft], "#000").iterate(it, "#00ff00")