extends Panel

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Singleton.gameOver:
		self.visible = false
