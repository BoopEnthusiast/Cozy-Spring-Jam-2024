extends Panel

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if self.visible == true:
		#wait for 30 secs then move on to picture
		await get_tree().create_timer(30.0).timeout
		get_tree().change_scene_to_file("res://scenes/main_menu_screen.tscn")
