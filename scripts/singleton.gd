extends Node

# Attribute multipliers
const SLOW_MULTIPLIER = 0.6
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
const ALL_RECIPES: Array[String] = [SLOW_RECIPE, LENGTHEN_RECIPE, HITBOX_RECIPE, POINTS_RECIPE, KILL_ALL_RECIPE, FOOD_INCREASE_RECIPE, SENTIENCE_RECIPE, STRENGTH_RECIPE]

var recipe_effectors: Array[Callable] = [Callable(self, "slow_lil_guys"), Callable(self, "lengthen_lives"), Callable(self, "bigger_hitboxes"), Callable(self, "point_gain_increase"), Callable(self, "kill_all"), Callable(self, "increase_food_worth"), Callable(self,"gain_sentience"), Callable(self, "gain_strength")]

# Global variables
var main_node: Node2D
var is_dragging := false
var food_Left := 0
var score := 0
var gameOver := false

# Which effects have been applied and how much
var speed = 300.0
var life_length = 10
var size = 1.5
var points_multiplier := 1
var food_worth = 1
var has_sentience := false
var has_strength := false


func slow_lil_guys() -> void:
	speed *= SLOW_MULTIPLIER
	apply_effects()


func lengthen_lives() -> void:
	life_length *= LENGTHEN_LIFE_MULTIPLIER
	apply_effects()


func bigger_hitboxes() -> void:
	size *= HITBOX_SIZE_MULTIPLIER
	apply_effects()


func point_gain_increase() -> void:
	points_multiplier *= NEXT_POINTS_GAINED_MULTIPLIER


func kill_all() -> void:
	for lil_guy: LilGuy in get_tree().get_nodes_in_group("lil_guy"):
		lil_guy.queue_free()


func increase_food_worth() -> void:
	food_worth *= FOOD_WORTH_MULTIPLIER
	apply_effects()


func gain_sentience() -> void:
	has_sentience = true
	if has_strength:
		gameOver = true
		


func gain_strength() -> void:
	has_strength = true
	if has_sentience:
		gameOver = true


func apply_effects() -> void:
	for lil_guy: LilGuy in get_tree().get_nodes_in_group("lil_guy"):
		lil_guy.update_effects() 
