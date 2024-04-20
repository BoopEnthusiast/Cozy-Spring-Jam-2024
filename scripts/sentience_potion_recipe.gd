extends RichTextLabel

var sentiencePotionUnlocked = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Singleton.score >= 20:
		sentiencePotionUnlocked = true
		
	if sentiencePotionUnlocked:
		self.visible = true

