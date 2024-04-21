extends Area2D


func _on_body_entered(body):
	if body is LilGuy:
		var lilGuy: LilGuy = body
		if lilGuy.is_dragging:
			if Singleton.food_Left > 0:
				Singleton.food_Left -= 1
				lilGuy.current_hunger_state = LilGuy.FoodLevel.HEALTHY
				lilGuy.hunger_changed.emit()
