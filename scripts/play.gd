extends Button


const MAIN = preload("res://scenes/main.tscn")

func _on_pressed():
	get_tree().change_scene_to_packed(MAIN)
	
