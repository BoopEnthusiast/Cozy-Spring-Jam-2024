extends AnimatedSprite2D

const MID_LEAF = preload("res://scenes/mid_leaf.tscn")
const STARTING_POSITION = -52
const INCREASE_HEIGHT_BY = 10.75

@onready var lil_guy: LilGuy = $".."
@onready var mid_leaves: Array[MidLeaf] = [$"../MidLeaf"]
@onready var leaf_top: AnimatedSprite2D = $"../LeafTop"


func _on_lil_guy_hunger_changed(hunger_state: int):
	match hunger_state:
		0:
			change_mid_leaf("default")
		1:
			change_mid_leaf("hungry")
		2:
			change_mid_leaf("starving")
		3:
			change_mid_leaf("dead")


func _on_lil_guy_merged():
	mid_leaves.resize(lil_guy.genes.size())
	for i in range(mid_leaves.size()):
		mid_leaves[i] = MID_LEAF.instantiate()
		get_parent().add_child(mid_leaves[i])
		mid_leaves[i].label.text = lil_guy.genes[i]
		mid_leaves[i].position.y = STARTING_POSITION - (float(i) * INCREASE_HEIGHT_BY)
		leaf_top.position.y = STARTING_POSITION - ((float(i) + 1) * INCREASE_HEIGHT_BY)


func change_mid_leaf(animation: String) -> void:
	play(animation)
	
	if animation == "default" or "hungry":
		for mid_leaf in mid_leaves:
			mid_leaf.play(animation)
			mid_leaf.visible = true
		
		leaf_top.play(animation)
		leaf_top.visible = true
	
	elif animation == "starving" or "dead":
		for mid_leaf in mid_leaves:
			mid_leaf.visible = false
		
		leaf_top.visible = false
	
	else:
		assert(false, "Animation passed to change_mid_leaf is not a recognized animation")
