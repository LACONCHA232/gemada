extends Node

var musica = load("res://sonidos/musica/musica.mp3")

func _ready():
	pass

func playMusic():
	$music.stream = musica
	$music.play()
 
