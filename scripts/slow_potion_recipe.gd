extends RichTextLabel

var slowPotionUnlocked = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Singleton.score >= 2:
		slowPotionUnlocked = true
		
	if slowPotionUnlocked:
		self.visible = true
		
