extends Control


# Called when the node enters the scene tree for the first time.
var current_scene = null

func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() -1 )
	print_debug(root)
	print_debug(current_scene)


var nombre_escena_actual = "res://escenas/nivel_1.tscn"



func _on_close_button_pressed():
	if nombre_escena_actual == "res://escenas/nivel_1.tscn":
		get_tree().change_scene_to_file("res://escenas/nivel_1.tscn")
		print("true")
	else:
		get_tree().change_scene_to_file("res://escenas/nivel_2.tscn")
		print("false")


func _on_button_pressed():
	get_tree().change_scene_to_file("res://escenas/interfaz-main.tscn")

