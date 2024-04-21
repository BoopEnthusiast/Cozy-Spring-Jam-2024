extends Panel

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Singleton.gameOver:
		self.visible = false
