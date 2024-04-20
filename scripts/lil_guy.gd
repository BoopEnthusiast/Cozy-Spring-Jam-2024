class_name LilGuy extends CharacterBody2D

signal hunger_changed
signal merged

enum FoodLevel {HEALTHY, HUNGRY, SARVING, DEAD}

var speed = 300.0
var direction: Vector2
var mouse_is_on := false
var is_dragging := false
var current_hunger_state: int = FoodLevel.HEALTHY
var genes: Array[String]
var food_worth: int = 1

@onready var label: Label = $Label
@onready var timer: Timer = $Timer
@onready var collider: CollisionShape2D = $Collider

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
	# 
	if is_dragging and is_on_wall():
		var collided_object = get_last_slide_collision().get_collider()
		if collided_object is LilGuy:
			collided_object.genes += genes
			collided_object.reset_gene_display()
			Singleton.is_dragging = false
			queue_free()
	
	# Bounce off walls
	if is_on_wall():
		direction = Vector2(randf() - 0.5, randf() - 0.5).normalized()
	
	# Move if not dead
	if not is_dragging:
		velocity = direction * speed
	elif is_dragging:
		global_position = get_global_mouse_position()
	elif current_hunger_state == FoodLevel.DEAD:
		velocity = Vector2.ZERO
	
	move_and_slide()


func _on_mouse_entered():
	mouse_is_on = true


func _on_mouse_exited():
	if not Singleton.is_dragging:
		mouse_is_on = false


func _on_timer_timeout():
	if current_hunger_state != FoodLevel.DEAD:
		current_hunger_state += 1
		hunger_changed.emit()


func reset_gene_display():
	var concat_genes: String
	for gene in genes:
		concat_genes += gene
		concat_genes += '\n'
	label.text = concat_genes

func _exit_tree():
	mouse_is_on = false
	Singleton.is_dragging = false
	is_dragging = false
