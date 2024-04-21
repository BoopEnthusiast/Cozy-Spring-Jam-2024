class_name Dispenser extends Button


const LIL_GUY = preload("res://scenes/lil_guy.tscn")

@export_enum("X", "Y", "Z") var gene: String


func _on_pressed():
	var new_lil_guy = LIL_GUY.instantiate()
	new_lil_guy.global_position = global_position + (size / 2) + Vector2(0, 500)
	new_lil_guy.genes.append(gene)
	Singleton.main_node.add_child(new_lil_guy)
