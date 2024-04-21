extends Area2D

@onready var food_left_display = $FoodLeft
@onready var audioStream: AudioStreamPlayer = $AudioStreamPlayer


func _on_body_entered(body):
	if body is LilGuy:
		print(body.is_dragging)
		if body.is_dragging:
			audioStream.play()
			body.queue_free()
			Singleton.food_Left += 1


func _process(_delta):
	food_left_display.text = "Food left: " + str(Singleton.food_Left)
