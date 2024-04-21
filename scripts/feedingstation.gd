extends Area2D


func _on_body_entered(body):
	print(Singleton.food_Left)
	if body is LilGuy:
		if Singleton.food_Left > 0:
			var lilGuy: LilGuy = body
			print("lilGuy")
			if lilGuy.is_dragging:
				print("it worky")
				Singleton.food_Left -= 1
				lilGuy.current_hunger_state = LilGuy.FoodLevel.HEALTHY
				lilGuy.hunger_changed.emit()
