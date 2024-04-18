class_name Dispenser extends Button


const LIL_GUY = preload("res://scenes/lil_guy.tscn")


func _on_pressed():
	var new_lil_guy = LIL_GUY.instantiate()
	new_lil_guy.global_position = global_position
	Singleton.main_node.add_child(new_lil_guy)
