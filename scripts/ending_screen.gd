extends CanvasLayer
@onready var animation_player = $TransitionScreen/AnimationPlayer
@onready var overthrowing_image = $CurrentScene/OverthrowingImage

signal transitioned
const OVERTHROW = preload("res://scripts/overthrowing.gd")

#func _process(delta):

func _ready():
	
	if Singleton.gameOver:
		transition()

func transition():
	animation_player.play("fade_to_normal")
	


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_to_normal":
		await get_tree().create_timer(10.0).timeout
		emit_signal("transitioned")
		animation_player.play("fade_to_black")
		self.get_child(0).queue_free()
		self.add_child(overthrowing_image)
		animation_player.play("fade_to_normal")


	
