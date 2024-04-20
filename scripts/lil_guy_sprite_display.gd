extends AnimatedSprite2D

@onready var lil_guy: LilGuy = $".."
@onready var mid_leaves: Array[AnimatedSprite2D] = [$"../MidLeaf"]
@onready var leaf_top: AnimatedSprite2D = $"../LeafTop"


func _on_lil_guy_hunger_changed(hunger_state: int):
	match hunger_state:
		0:
			play("default")
			for mid_leaf in mid_leaves:
				mid_leaf.play("default")
				mid_leaf.visible = true
			leaf_top.play("default")
			leaf_top.visible = true
		1:
			play("hungry")
			for mid_leaf in mid_leaves:
				mid_leaf.play("hungry")
				mid_leaf.visible = true
			leaf_top.play("hungry")
			leaf_top.visible = true
		2:
			play("starving")
			for mid_leaf in mid_leaves:
				mid_leaf.visible = false
			leaf_top.visible = false
		3:
			play("dead")
			for mid_leaf in mid_leaves:
				mid_leaf.visible = false
			leaf_top.visible = false


func _on_lil_guy_merged():
	#mid_leaves.reduce()
	pass
