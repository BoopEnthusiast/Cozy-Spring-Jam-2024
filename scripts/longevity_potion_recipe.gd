extends RichTextLabel

var longevityPotionUnlocked = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Singleton.score >= 30:
		longevityPotionUnlocked = true
		
	if longevityPotionUnlocked:
		self.visible = true
