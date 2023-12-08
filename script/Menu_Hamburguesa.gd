extends TextureButton

@export_file() var current_scene = null

func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() -1 )
	print_debug(root)
	print_debug(current_scene)



func _on_pressed():
	get_tree().change_scene_to_file("res://escenas/interfaz-ajustes-Juego.tscn");


