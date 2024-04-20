extends Node

# Attribute multipliers
const SLOW_MULTIPLIER = 0.8
const LENGTHEN_LIFE_MULTIPLIER = 1.5
const HITBOX_SIZE_MULTIPLIER = 1.3
const NEXT_POINTS_GAINED_MULTIPLIER = 1.5
const FOOD_WORTH_MULTIPLIER = 2

# Potion recipes
const SLOW_RECIPE = "XYZZYZXXZ"
const LENGTHEN_RECIPE = "ZZZYYZYXXX"
const HITBOX_RECIPE = "XYXYX"
const POINTS_RECIPE = "XYZZYXZYXXZY"
const KILL_ALL_RECIPE = "YYYYXXXXZZZZ"
const FOOD_INCREASE_RECIPE = "ZYXYXZYX"
const SENTIENCE_RECIPE = "ZYXYZXZXYZXYYZXZXYXZXXYZX"
const STRENGTH_RECIPE = "XZYXZXYZYXZXZXZYXYYZXYYZXXZYY"
const ALL_RECIPES = [SLOW_RECIPE, LENGTHEN_RECIPE, HITBOX_RECIPE, POINTS_RECIPE, KILL_ALL_RECIPE, FOOD_INCREASE_RECIPE, SENTIENCE_RECIPE, STRENGTH_RECIPE]

var recipe_effectors: Array[Callable] = [Callable(self, "slow_lil_guys"), Callable(self, "lengthen_lives"), Callable(self, "bigger_hitboxes"), Callable(self, "point_gain_increase"), Callable(self, "kill_all"), Callable(self, "increase_food_worth"), Callable(self,"gain_sentience"), Callable(self, "gain_strength")]

# Global variables
var main_node: Node2D
var is_dragging := false
var food_Left := 0
var score := 0
var points_multiplier := 1
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
		lil_guy.scale *= HITBOX_SIZE_MULTIPLIER


func point_gain_increase() -> void:
	points_multiplier *= NEXT_POINTS_GAINED_MULTIPLIER


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
