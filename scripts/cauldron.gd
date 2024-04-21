class_name Cauldron extends Area2D

const ALL_GENES = ["X", "Y", "Z"]

var first_genes := ""
var second_genes := ""
var current_recipe: String = "X"
var current_recipe_length := 1

@onready var current_label = $Current
@onready var recipe_label = $Recipe
@onready var slots_left_label = $SlotsLeft


func _on_body_entered(body):
	if body is LilGuy and body.is_dragging:
		body = body as LilGuy
		if first_genes.is_empty():
			first_genes = body.get_genes_as_string()
			body.queue_free()
		elif second_genes.is_empty():
			second_genes = body.get_genes_as_string()
			body.queue_free()
		update_label()


func _on_button_pressed():
	first_genes = ""
	second_genes = ""
	update_label()


func update_label():
	current_label.text = first_genes + second_genes
	var slots_left = 2
	if not first_genes.is_empty():
		slots_left -= 1
	if not second_genes.is_empty():
		slots_left -= 1
	slots_left_label.text = str(slots_left)
	
	if current_label.text == current_recipe:
		Singleton.score += current_recipe_length * Singleton.points_multiplier
		Singleton.points_multiplier = 1
		generate_recipe()
		return
	var index = 0
	for recipe in Singleton.ALL_RECIPES:
		if recipe == current_label.text:
			Singleton.recipe_effectors[index].call()
		index += 1


func generate_recipe():
	current_recipe = ""
	current_recipe_length += 1
	for i in range(current_recipe_length):
		current_recipe += ALL_GENES.pick_random()
	recipe_label.text = current_recipe
	first_genes = ""
	second_genes = ""
	update_label()
