extends Node2D
@onready var pause_menu = $PauseMenu


# Called when the node enters the scene tree for the first time.
func _enter_tree():
	Singleton.main_node = self

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		pause_menu.visible = true
		print("pausing")
		get_tree().paused = true
		print(pause_menu.get_child(0).global_position)
		
		


