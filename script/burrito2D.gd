extends Area2D




func _on_body_entered(body):
	if body.get_name() == "Player2":
		#emit_signal("burritoCollected")
		queue_free()
