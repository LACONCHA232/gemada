extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_close_button_pressed():
	get_tree().change_scene_to_file("res://escenas/interfaz-main.tscn")


func _on_tutorial_pressed():
	get_tree().change_scene_to_file("res://escenas/nivel_1.tscn")


func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://escenas/nivel_2.tscn")

