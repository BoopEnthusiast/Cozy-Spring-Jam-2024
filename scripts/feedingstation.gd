extends Area2D




func _on_body_entered(body):
	#feed a lilguy when it touches here and you have food
	if Singleton.is_dragging and body is LilGuy and Singleton.food_Left > 0:
		Singleton.food_Left -= 1
		#add to lilguy timer 
