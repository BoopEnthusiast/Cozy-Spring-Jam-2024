extends Node

const SLOW_MULTIPLIER = 0.8
const LENGTHEN_LIFE_MULTIPLIER = 1.5

var main_node: Node2D
var is_dragging := false
var food_Left := 0
var score := 0


func slow_lil_guys() -> void:
	for lil_guy: LilGuy in get_tree().get_nodes_in_group("lil_guy"):
		lil_guy.speed *= SLOW_MULTIPLIER


func lengthen_lives() -> void:
	for lil_guy: LilGuy in get_tree().get_nodes_in_group("lil_guy"):
		if is_instance_valid(lil_guy.timer):
			lil_guy.timer.wait_time *= LENGTHEN_LIFE_MULTIPLIER
