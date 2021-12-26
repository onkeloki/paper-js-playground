class Spiral
	constructor: ()->
		@frame = Path.Rectangle(new Point(0, 0), new Size(window.innerWidth, window.innerHeight))
		@frame.fillColor = "#fff"

		@circle = Path.Circle(@frame.bounds.center, @frame.bounds.height / 2)
		@circle.strokeColor = "#c0c0c0"

		@cogRadius = @circle.bounds.width / 5
		@cog = Path.Circle(@frame.bounds.center, @cogRadius)
		@cog.strokeColor = "#c0c0c0"
		@drawPoint = Path.Circle(@frame.bounds.center, 10)
		@drawPoint.fillColor = "red"
		@arm = new Path
			segments: [@circle.bounds.center, @circle.bounds.rightCenter]
		@arm.strokeWidth = 3
		@arm.strokeColor = "#c0c0c0"
		@g = new Group [@cog, @drawPoint]
		@g.position.x += ( @circle.bounds.width / 2) - @cog.bounds.width / 2


		@drawPoint.position.x += @cog.bounds.width / 4.3
		#@drawPoint.position.y += 20
		@line = new Path
			strokeColor: 'black'
			strokeWidth: 1

		@armgroup = new Group [@arm, @g]

	onFrame: (e)->
		#return
		s = Math.sin(e.count)
		@line.smooth({type: 'continuous'});
		newPoint = @drawPoint.position
		@g.rotate(-10)
		@armgroup.rotate(4.1, @circle.bounds.center)
		@line.add newPoint
		if @line.segments.length > 0
			first = @line.segments[0]


#console.log @line


s = new Spiral()

onFrame = s.onFrame.bind s