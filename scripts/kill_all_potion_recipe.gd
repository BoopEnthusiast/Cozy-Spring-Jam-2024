extends RichTextLabel

var killPotionUnlocked = false
var killArray: Array[String] = ["????????????", "YYYYXXXXZZZZ"]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Singleton.score < 150:
		text = killArray[0]
		
	if Singleton.score >= 150:
		killPotionUnlocked = true
		
	if killPotionUnlocked:
		text = killArray[1]

