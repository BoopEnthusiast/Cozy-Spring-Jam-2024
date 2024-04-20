extends RichTextLabel

var foodPotionUnlocked = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Singleton.score >= 16:
		foodPotionUnlocked = true
		
	if foodPotionUnlocked:
		self.visible = true
