extends Button

@onready var pause_menu = $".."


func _on_pressed():
	pause_menu.visible = false
	print("resume")
	get_tree().paused = false
	print(pause_menu.global_position)
