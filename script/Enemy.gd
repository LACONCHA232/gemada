extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var speed = 35
var moving_left = true
var was_colliding = false

func _ready():
	$Node2D/AnimatedSprite2D.play("walk")
	

func _process(delta):
	move_character()
	turn()
	
func move_character():
	velocity.y +=gravity
	if(moving_left):
		velocity.x = -speed
		move_and_slide()
	else:
		velocity.x = speed
		move_and_slide()


func _on_area_2d_body_entered(body):
	if body.get_name() == "Player2":
		get_tree().reload_current_scene()
		#body._loseLife()


func turn():
	var is_colliding = $RayCast2D.is_colliding()
	if not $RayCast2D.is_colliding():
		moving_left = !moving_left
		scale.x = -scale.x
