extends Button
@onready var pause_menu = $".."

const MAIN_MENU_SCREEN = preload("res://scenes/main_menu_screen.tscn")

func _on_pressed():
	#take player back to main menu
	pause_menu.visible = false
	get_tree().change_scene_to_packed(MAIN_MENU_SCREEN)
	
	
