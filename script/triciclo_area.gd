extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if entered == true:
		get_tree().change_scene_to_file("res://escenas/nivel_2.tscn")

var entered = false

func _on_body_entered(body: CharacterBody2D):
	entered = true 


func _on_body_exited(body: CharacterBody2D):
	entered = false
