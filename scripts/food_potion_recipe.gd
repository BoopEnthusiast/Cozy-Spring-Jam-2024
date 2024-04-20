extends RichTextLabel

var foodPotionUnlocked = false
var foodArray: Array[String] = ["????????", "ZYXYXZYX"]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if Singleton.score < 200:
		text = foodArray[0]
	
	if Singleton.score >= 200:
		foodPotionUnlocked = true
		
	if foodPotionUnlocked:
		text = foodArray[1]
