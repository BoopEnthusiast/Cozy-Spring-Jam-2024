extends RichTextLabel

var hitboxPotionUnlocked = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Singleton.score >= 6:
		hitboxPotionUnlocked = true
		
	if hitboxPotionUnlocked:
		self.visible = true
