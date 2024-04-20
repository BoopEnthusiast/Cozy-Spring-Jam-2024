extends RichTextLabel

var strengthPotionUnlocked = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Singleton.score >= 1000:
		strengthPotionUnlocked = true
		
	if strengthPotionUnlocked:
		self.visible = true

