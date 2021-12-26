class Carpet
	constructor: ()->
		@colors = ["#F8F8FF", "#CCE7D3", "#FEE39F", "#E69AC2", "#A6D0F9"]
		@colors = ["#fff"]
		@types = ["tl", "tr", "bl", "br", "", "", "", "", "", "", "", ""]
		@minScale = 1;
		@maxScale = 2;
		@scales = [@minScale..@maxScale]
		@strokes = [1..3]

		@segmentSize = 40
		for x in [0..50]
			for y in [0..50]
				@fullSquare(x, y)
	getRandomFrom: (array)->
		array[Math.floor(Math.random() * array.length)]

	fullSquare: (x, y)->
		x = x * @segmentSize * 2
		y = y * @segmentSize * 2
		@triangle(0 + x, 0 + y, @getRandomFrom(@colors), @getRandomFrom(@types)).scale(@getRandomFrom(@scales))
		@triangle(@segmentSize + x, 0 + y, @getRandomFrom(@colors), @getRandomFrom(@types)).scale(@getRandomFrom(@scales))
		@triangle(0 + x, @segmentSize + y, @getRandomFrom(@colors), @getRandomFrom(@types)).scale(@getRandomFrom(@scales))
		@triangle(@segmentSize + x, @segmentSize + y, @getRandomFrom(@colors), @getRandomFrom(@types)).scale(@getRandomFrom(@scales))


	triangle: (shiftX, shiftY, color, type)->
		if type is "tl"
			t = new Path
				segments: [
					[0 + shiftX, 0 + shiftY]
					[@segmentSize + shiftX, 0 + shiftY]
					[0 + shiftX, @segmentSize + shiftY]
				]
				fillColor: color


		if type is "tr"
			t = new Path
				segments: [
					[0 + shiftX, 0 + shiftY]
					[@segmentSize + shiftX, 0 + shiftY]
					[@segmentSize + shiftX, @segmentSize + shiftY]
				]
				fillColor: color
		if type is "bl"
			t = new Path
				segments: [
					[0 + shiftX, 0 + shiftY]
					[@segmentSize + shiftX, @segmentSize + shiftY]
					[0 + shiftX, @segmentSize + shiftY]
				]
				fillColor: color
		if type is "br"
			t = new Path
				segments: [
					[@segmentSize + shiftX, 0 + shiftY]
					[@segmentSize + shiftX, @segmentSize + shiftY]
					[0 + shiftX, @segmentSize + shiftY]
				]
				fillColor: color
		if not t
			t = new Path()
		t.strokeWidth = @getRandomFrom(@strokes)
		t.strokeColor = "#000"

		t


new Carpet()