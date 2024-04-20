extends AnimatedSprite2D

@onready var lil_guy: LilGuy = $".."
@onready var mid_leaves: Array[AnimatedSprite2D] = [$"../MidLeaf"]
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
	#mid_leaves.reduce()
	pass


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
