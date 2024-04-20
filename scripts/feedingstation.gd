extends Area2D


func _on_body_entered(body):
	if body.is_dragging and body is LilGuy and Singleton.food_Left > 0:
		Singleton.food_Left -= 1
		body.hunger_state = 0
