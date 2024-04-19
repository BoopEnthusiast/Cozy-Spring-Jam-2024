extends Node2D

# Called when the node enters the scene tree for the first time.
func _enter_tree():
	Singleton.main_node = self

func _input(event):
	if Input.is_action_just_pressed("click"):
		if not Singleton.is_dragging:
			Singleton.is_dragging = true
	elif Input.is_action_just_released("click") and Singleton.is_dragging:
		Singleton.is_dragging = false
