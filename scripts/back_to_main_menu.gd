extends Button
@onready var pause_menu = $".."

func _on_pressed():
	#take player back to main menu
	pause_menu.visible = false
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu_screen.tscn")
	
	
