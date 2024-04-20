extends RichTextLabel

var strengthPotionUnlocked = false
var strengthArray: Array[String] = ["????????????????????????", "XZYXZXYZYXZXZXZYXYYZXYYZXXZYY"]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Singleton.score < 1000:
		text = strengthArray[0]
		
	if Singleton.score >= 1000:
		strengthPotionUnlocked = true
		
	if strengthPotionUnlocked:
		text = strengthArray[1]
		

