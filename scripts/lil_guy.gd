class_name LilGuy extends CharacterBody2D


const SPEED = 300.0

var direction: Vector2
var mouse_is_on := false
var is_dragging := false


func _ready():
	direction = Vector2(randf() - 0.5, randf() - 0.5).normalized()


func _input(event):
	if Input.is_action_just_pressed("click"):
		print(mouse_is_on)
		if mouse_is_on and not Singleton.is_dragging:
			is_dragging = true
			Singleton.is_dragging = true
	elif Input.is_action_just_released("click") and is_dragging:
		Singleton.is_dragging = false
		is_dragging = false


func _physics_process(delta):
	if is_on_wall():
		direction = Vector2(randf() - 0.5, randf() - 0.5).normalized()
	
	if not is_dragging:
		velocity = direction * SPEED
	else:
		velocity = Vector2.ZERO
		global_position = get_global_mouse_position()
	
	move_and_slide()


func _on_mouse_entered():
	mouse_is_on = true


func _on_mouse_exited():
	mouse_is_on = false
