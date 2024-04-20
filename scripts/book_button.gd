extends Button
@onready var recipes_screen = $".."
@onready var animation_player = $"../../AnimationPlayer"

var recipesInFrame = false

func _on_pressed():
	#when is pressed check if recipes is already in frame
	if recipesInFrame:
		#move recipes into frame
		recipesInFrame = false
		animation_player.play("close_recipes")
		
	elif not recipesInFrame:
		#move recipes out of frame
		recipesInFrame = true
		animation_player.play("open_recipes")
