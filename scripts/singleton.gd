extends Node

# Attribute multipliers
const SLOW_MULTIPLIER = 0.8
const LENGTHEN_LIFE_MULTIPLIER = 1.5
const HITBOX_SIZE_MULTIPLIER = 1.3
const FOOD_WORTH_MULTIPLIER = 2

# Potion recipes
const SLOW_RECIPE = "XYZZYZXXZ"
const LENGTHEN_RECIPE = "ZZZYYZYXXX"
const HITBOX_RECIPE = "XYXYX"
const POINTS_RECIPE = "XYZZYXZYXXZY"
const KILL_ALL_RECIPE = "YYYYXXXXZZZZ"

# Global variables
var main_node: Node2D
var is_dragging := false
var food_Left := 0
var score := 0
var has_sentience := false
var has_strength := false


func slow_lil_guys() -> void:
	for lil_guy: LilGuy in get_tree().get_nodes_in_group("lil_guy"):
		lil_guy.speed *= SLOW_MULTIPLIER


func lengthen_lives() -> void:
	for lil_guy: LilGuy in get_tree().get_nodes_in_group("lil_guy"):
		if is_instance_valid(lil_guy.timer):
			lil_guy.timer.wait_time *= LENGTHEN_LIFE_MULTIPLIER


func bigger_hitboxes() -> void:
	for lil_guy: LilGuy in get_tree().get_nodes_in_group("lil_guy"):
		lil_guy.collider.shape.size *= HITBOX_SIZE_MULTIPLIER


func point_gain_increase() -> void:
	pass


func kill_all() -> void:
	for lil_guy: LilGuy in get_tree().get_nodes_in_group("lil_guy"):
		lil_guy.queue_free()


func increase_food_worth() -> void:
	for lil_guy: LilGuy in get_tree().get_nodes_in_group("lil_guy"):
		lil_guy.food_worth *= FOOD_WORTH_MULTIPLIER


func gain_sentience() -> void:
	has_sentience = true


func gain_strength() -> void:
	has_strength = true
