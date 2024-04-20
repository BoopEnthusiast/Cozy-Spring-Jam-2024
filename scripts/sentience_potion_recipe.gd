extends RichTextLabel

var sentiencePotionUnlocked = false
var sentArray: Array[String] = ["????????????????????????", "ZYXYZXZXYZXYYZXZXYXZXXYZX"]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if Singleton.score < 500:
		text = sentArray[0]
		
	if Singleton.score >= 500:
		sentiencePotionUnlocked = true
		
	if sentiencePotionUnlocked:
		text = sentArray[1]

