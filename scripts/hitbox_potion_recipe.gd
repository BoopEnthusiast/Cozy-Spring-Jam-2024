extends RichTextLabel

var hitboxPotionUnlocked = false
var hitArray: Array[String] = ["?????", "XYXYX"]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if Singleton.score < 50:
		text = hitArray[0]
		
	if Singleton.score >= 50:
		hitboxPotionUnlocked = true
		
	if hitboxPotionUnlocked:
		text = hitArray[1]
