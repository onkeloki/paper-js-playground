class Flower
	constructor: (@cou)->
		paper.project.activeLayer.removeChildren();

		@count = 30
		project.currentStyle = {
			fillColor: '#fff',
			strokeColor: 'black',
			strokeWidth: 2
		}
		@rectangle = new Path.Circle(new Point(500, 500), 50).scale(0.5, 2);
		@rotationPoint = @rectangle.bounds.topCenter
		for i in [0..@count]
			@createClone(360 / @count * i)


	createClone: (r)->
		c = @rectangle.clone()
		c.rotate(Math.sin(r)*@cou+r, @rotationPoint)


onFrame = (event)->

	new Flower(event.count)



