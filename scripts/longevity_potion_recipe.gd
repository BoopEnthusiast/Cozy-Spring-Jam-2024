extends RichTextLabel

var longevityPotionUnlocked = false
var longArray: Array[String] = ["??????????", "ZZZYYZYXXX"]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Singleton.score < 30:
		text = longArray[0]
		
	if Singleton.score >= 30:
		longevityPotionUnlocked = true
		
	if longevityPotionUnlocked:
		text = longArray[1]
