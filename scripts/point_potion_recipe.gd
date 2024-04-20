extends RichTextLabel

var pointPotionUnlocked = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Singleton.score >= 90:
		pointPotionUnlocked = true
		
	if pointPotionUnlocked:
		self.visible = true

