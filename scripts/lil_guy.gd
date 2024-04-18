class_name LilGuy extends CharacterBody2D


const SPEED = 300.0

var direction: Vector2


func _ready():
	direction = Vector2(randf() - 0.5, randf() - 0.5).normalized()


func _physics_process(delta):
	if is_on_wall():
		direction = Vector2(randf() - 0.5, randf() - 0.5).normalized()
	
	velocity = direction * SPEED
	
	move_and_slide()
