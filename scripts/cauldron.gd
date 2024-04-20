extends Area2D
class_name cauldron

var combanatiom: Array[String]
@onready var label: Label = $Label
@onready var preloaded = preload("res://scenes/lil_guy.tscn")

func _on_body_entered(body):
	if Singleton.is_dragging and body is LilGuy:
		var lilGuy: LilGuy = body
		combanatiom.append_array(lilGuy.genes)
		get_parent().remove_child(lilGuy)
		var genes: String
		for gene in combanatiom:
			genes += gene
		label.text = genes


func _on_button_pressed():
	if not combanatiom.is_empty():
		var lilguy = preloaded.instantiate()
		lilguy.genes.append_array(combanatiom)
		lilguy.global_position = global_position
		combanatiom.clear()
		label.text = ""
		get_parent().add_child(lilguy)
