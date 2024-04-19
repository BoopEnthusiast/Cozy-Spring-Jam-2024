extends Area2D
class_name cauldron

var combanatiom: Array[String]
@onready var label: Label = $Label

func _on_body_entered(body):
	if Singleton.is_dragging and body is LilGuy:
		var lilGuy: LilGuy = body
		for gene in lilGuy.genes:
			combanatiom.append(gene)
		get_parent().remove_child(body)
		var genes: String
		for gene in combanatiom:
			genes += gene
		label.text = genes
