extends Area2D

@onready var food_left_display = $FoodLeft


func _on_body_entered(body):
	if body.is_dragging and body is LilGuy:
		body.queue_free()
		Singleton.food_Left += 1


func _process(delta):
	food_left_display.text = "Food left: " + str(Singleton.food_Left)
