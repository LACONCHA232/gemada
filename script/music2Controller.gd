extends Node
# musica del nivel 2
var musica2 = load("res://sonidos/musica/musica2.mp3");

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func playMusic2():
	$music2.stream = musica2
	$music2.play()
