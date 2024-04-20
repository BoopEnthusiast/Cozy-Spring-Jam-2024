class_name LilGuy extends CharacterBody2D

signal hunger_changed
signal merged

enum FoodLevel {HEALTHY, HUNGRY, STARVING, DEAD}

var speed = 300.0
var direction: Vector2
var mouse_is_on := false
var is_dragging := false
var current_hunger_state: FoodLevel = FoodLevel.HEALTHY
var genes: Array[String]
var food_worth: int = 1
var in_cauldron := false

@onready var label: Label = $Label
@onready var timer: Timer = $Timer
@onready var collider: CollisionShape2D = $Collider
@onready var sprite: AnimatedSprite2D = $Sprite
@onready var midLeaf: AnimatedSprite2D = $MidLeaf
@onready var leafTop: AnimatedSprite2D = $LeafTop


func _input(_event):
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


func _physics_process(_delta):
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
	
	if is_dragging:
		global_position = get_global_mouse_position()
		velocity = Vector2.ZERO
	elif current_hunger_state == FoodLevel.DEAD:
		velocity = Vector2.ZERO
	else:
		velocity = direction * speed
	
	# Die when running out of hunger
	if timer.time_left <= 20 and timer.time_left > 10:
		current_hunger_state = FoodLevel.HUNGRY
		hunger_changed.emit()
	if timer.time_left <= 10 and timer.time_left > 0:
		current_hunger_state = FoodLevel.STARVING
		hunger_changed.emit()
	if timer.time_left <= 0:
		current_hunger_state = FoodLevel.DEAD
		hunger_changed.emit()
	
	update_sprite()
	
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
	if not in_cauldron:
		mouse_is_on = false
		Singleton.is_dragging = false
		is_dragging = false


func get_genes_as_string() -> String:
	var concat_genes: String = ""
	for gene in genes:
		concat_genes += gene
	return concat_genes

func update_sprite():
	# Flip the horizontals of the animation depending on the direction
	sprite.flip_h = direction.x > 0
	
	# Play the animation based off the food level
	if current_hunger_state == FoodLevel.HEALTHY:
		sprite.play("healthy_walk")
	if current_hunger_state == FoodLevel.HUNGRY:
		sprite.play("hungry_walk")
		midLeaf.play("hungry")
		leafTop.play("hungry")
	if current_hunger_state == FoodLevel.STARVING:
		sprite.play("hungry_walk")
		midLeaf.hide()
		leafTop.hide()
	if current_hunger_state == FoodLevel.DEAD:
		sprite.play("dead")
