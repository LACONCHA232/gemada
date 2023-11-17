extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#Escucha el evento del boton "inicar partidas" para que cuando sea precionado ejecute el juego
func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://escenas/nivel_1.tscn")

#Escucha el evento del boton "personaje" para que cuando sea precionado ejecute la ventana personaje
func _on_pressed():
	get_tree().change_scene_to_file("res://escenas/interfaz-personaje.tscn")

#Escucha el evento del boton "ajustes" para que cuando sea precionado ejecute la ventana ajustes
func _on_settings_button_pressed():
	get_tree().change_scene_to_file("res://escenas/interfaz-ajustes.tscn")

#Esta funcion le da la funcionalidad al boton de salir
func _on_close_button_pressed():
	get_tree().change_scene_to_file("res://escenas/interfaz-main.tscn")


#el button se refiere al boton de jugar
func _on_button_pressed():
	get_tree().change_scene_to_file("res://escenas/nivel_1.tscn")
