extends CharacterBody2D

#Se declaran constantes para establecer valores que nunca cambiaran en el juego
#La velocidad se aplica al eje X
#La velocidad de salto es negativa porque en Godot los negaticos estan hacia arriba del plano
const SPEED = 150
const JUMP_VELOCITY = -300

#Agarras la gravedad que ya trea por defecto godot y hace que interactue con los rigid bodies, como el piso
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#Instanciamos nuestras animaciones que estan en estos nodos y las instanciamos listas para cambiar de frames 
@onready var animaciones = $Node2D/AnimatedSprite2D
@onready var jump = $jumpSound
@onready var landing = $landingSound
@onready var music2 = $musica2

func _ready():
	music2.play();

 
#Se ejecuta la simulación de física. Es donde la lógica de movimiento y comportamiento del personaje se colocará.
func _physics_process(delta):
	#Si el personaje no esto en el piso, se aplicara el movimiento en el eje Y para que caiga
	if not is_on_floor():
		velocity.y += gravity * delta
		landing.play()

	#Si se preciona el evento provoca el salto, entonces salta
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump.play()

	#Se obtiene la dirección de entrada horizontal utilizando los ejes configurados como "ui_left" y "ui_right". 
	#Si direction no es cero (lo que significa que hay entrada), se actualiza la velocidad horizontal del personaje (velocity.x)
	# y se reproduce la animación correspondiente ("walk" o "stop"). 
	#Además, se llama a la función update_flipH para actualizar la orientación del sprite según la dirección del movimiento.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		animaciones.play("walk")
		update_flipH(velocity)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animaciones.play("stop")

	#el personaje se mueve y se desliza (para evitar colisiones con otros objetos) usando move_and_slide, 
	#una función proporcionada por Godot para movimiento en 2D.
	move_and_slide()


#Esta funcione hace que el sprite gire a la izquierda cuando se va en esa direccion
func update_flipH(direction): 
	animaciones.flip_h = direction.x < 0




