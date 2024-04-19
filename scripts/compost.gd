extends Area2D


func _on_body_entered(body):
	#if is dragging 
	if Singleton.is_dragging and body is LilGuy:
		body.queue_free()
		Singleton.is_dragging = false
		Singleton.food_Left += 1
	
