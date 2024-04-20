extends RichTextLabel

var pointPotionUnlocked = false
var pointArray: Array[String] = ["????????????", "XYZZYXZYXXZY"]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if Singleton.score < 90:
		text = pointArray[0]
		
	if Singleton.score >= 90:
		pointPotionUnlocked = true
		
	if pointPotionUnlocked:
		text = pointArray[1]

