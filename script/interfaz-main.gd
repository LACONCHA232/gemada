extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#Escucha el evento del boton "inicar partidas" para que cuando sea precionado ejecute el juego
func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://escenas/nivel_1.tscn")
	
	
 
 
