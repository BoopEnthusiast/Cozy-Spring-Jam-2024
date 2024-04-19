class_name LilGuy extends CharacterBody2D


const SPEED = 300.0

var direction: Vector2
var mouse_is_on := false
var is_dragging := false
var hunger_state: int = 0
var genes: Array[String]

@onready var label = $Label


func _input(event):
	if Input.is_action_just_pressed("click"):
		if mouse_is_on and not Singleton.is_dragging:
			is_dragging = true
			Singleton.is_dragging = true
	elif Input.is_action_just_released("click") and is_dragging:
		Singleton.is_dragging = false
		is_dragging = false


func _ready():
	direction = Vector2(randf() - 0.5, randf() - 0.5).normalized()
	reset_gene_display()


func _physics_process(delta):
	if is_on_wall():
		direction = Vector2(randf() - 0.5, randf() - 0.5).normalized()
	
	if not is_dragging:
		velocity = direction * SPEED
	elif is_dragging or hunger_state > 3:
		velocity = Vector2.ZERO
		global_position = get_global_mouse_position()
	
	move_and_slide()
	
	if is_dragging and is_on_wall():
		var collided_object = get_last_slide_collision().get_collider()
		if collided_object is LilGuy:
			collided_object.genes += genes
			collided_object.reset_gene_display()
			Singleton.is_dragging = false
			queue_free()


func _on_mouse_entered():
	mouse_is_on = true


func _on_mouse_exited():
	if not Singleton.is_dragging:
		mouse_is_on = false


func _on_timer_timeout():
	hunger_state += 1


func reset_gene_display():
	var concat_genes: String
	for gene in genes:
		concat_genes += gene
		concat_genes += '\n'
	label.text = concat_genes
