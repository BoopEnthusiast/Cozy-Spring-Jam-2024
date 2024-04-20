extends RichTextLabel

var killPotionUnlocked = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Singleton.score >= 13:
		killPotionUnlocked = true
		
	if killPotionUnlocked:
		self.visible = true

