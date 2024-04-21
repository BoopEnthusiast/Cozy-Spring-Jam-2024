extends AnimatedSprite2D

const MID_LEAF = preload("res://scenes/mid_leaf.tscn")
const STARTING_POSITION = -52
const INCREASE_HEIGHT_BY = 10.75

@onready var lil_guy: LilGuy = $".."
@onready var mid_leaves: Array[MidLeaf] = [$"../MidLeaf"]
@onready var leaf_top: AnimatedSprite2D = $"../LeafTop"


func _on_lil_guy_hunger_changed():
	match lil_guy.current_hunger_state:
		lil_guy.FoodLevel.HEALTHY:
			change_mid_leaf("default")
		lil_guy.FoodLevel.HUNGRY:
			change_mid_leaf("hungry")
		lil_guy.FoodLevel.STARVING:
			change_mid_leaf("starving")
		lil_guy.FoodLevel.DEAD:
			change_mid_leaf("dead")


func _on_lil_guy_merged():
	mid_leaves.resize(lil_guy.genes.size())
	for i in range(mid_leaves.size()):
		mid_leaves[i] = MID_LEAF.instantiate()
		get_parent().add_child(mid_leaves[i])
		mid_leaves[i].label.text = lil_guy.genes[i]
		mid_leaves[i].position.y = STARTING_POSITION - (float(i) * INCREASE_HEIGHT_BY)
		leaf_top.position.y = STARTING_POSITION - ((float(i) + 1) * INCREASE_HEIGHT_BY)


func change_mid_leaf(animation_name: String) -> void:
	play(animation_name)
	
	if animation_name == "default" or "hungry":
		for mid_leaf in mid_leaves:
			mid_leaf.play(animation_name)
			mid_leaf.visible = true
		
		leaf_top.play(animation_name)
		leaf_top.visible = true
	
	elif animation_name == "starving" or "dead":
		for mid_leaf in mid_leaves:
			mid_leaf.visible = false
		
		leaf_top.visible = false
	
	else:
		assert(false, "Animation passed to change_mid_leaf is not a recognized animation")
