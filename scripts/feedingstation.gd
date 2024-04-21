extends Area2D


func _on_body_entered(body):
	print(body)
	if body is LilGuy:
		var lilGuy: LilGuy = body
		print("is lilGuy")
		print(lilGuy.is_dragging)
		if lilGuy.is_dragging:
			print("lilGuy")
			if Singleton.food_Left > 0:
				print("it worky")
				Singleton.food_Left -= 1
				lilGuy.current_hunger_state = LilGuy.FoodLevel.HEALTHY
				lilGuy.hunger_changed.emit()
