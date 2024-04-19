extends Button

@onready var pause_menu = $".."


func _on_pressed():
	pause_menu.visible = false
	get_tree().paused = false
