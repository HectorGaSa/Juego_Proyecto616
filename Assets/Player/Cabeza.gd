extends CharacterBody2D

const Fuego = preload("res://Assets/Player/fuego.tscn")
const Cabeza = preload("res://Assets/Player/Cabeza.tscn")

var anim_player
var fuego
var direction = Vector2.ZERO
var speed = 5  # Velocidad de movimiento

func _ready():
	anim_player = $AnimatedSprite2D
	fuego = get_node("Shoot/Fuego")

	

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shootFire()
	move()

	# Lógica para detectar las pulsaciones de teclas y actualizar la dirección
func move():
	direction = Vector2.ZERO
	if Input.is_action_pressed("shoot_right"):
		anim_player.play("Look_Right")
		shootFire()
		anim_player.stop()
	if Input.is_action_pressed("shoot_left"):
		anim_player.play("Look_Left")
		shootFire()
		anim_player.stop()
	if Input.is_action_pressed("shoot_down"):
		anim_player.play("Look_Down")
		shootFire()
		anim_player.stop()
	if Input.is_action_pressed("shoot_up"):
		anim_player.play("Look_Up")
		shootFire()
		anim_player.stop()


	
	# Lógica para reproducir las animaciones de movimiento
	#if direction != Vector2.ZERO:
		#if abs(direction.x) > abs(direction.y):
			#if direction.x > 0:
				#anim_player.play("Look_Right")
			#else:
				#anim_player.play("Look_Left")
		#else:
			#if direction.y > 0:
				#anim_player.play("Look_Down")
			#else:
				#anim_player.play("Look_Up")
	#else:
		# Si no hay movimiento, detén la animación
		#anim_player.stop()


func shootFire():
	var shoot_fire = fuego
	shoot_fire.scale = Vector2()
	if $AnimatedSprite2D.flip_h:
		$Shoot.scale.x = -1
		shoot_fire.scale = Vector2(-2.3, 2.3)
		shoot_fire.velocidad = -320
	else:
		$Shoot.scale.x = 1
		shoot_fire.scale = Vector2(2.3, 2.3)
		shoot_fire.velocidad = 320
	if $AnimatedSprite2D.flip_v:
		$Shoot.scale.y = -1
		shoot_fire.scale = Vector2(-2.3, 2.3)
		shoot_fire.velocidad = -320
	else:
		$Shoot.scale.y = 1
		shoot_fire.scale = Vector2(2.3, 2.3)
		shoot_fire.velocidad = 320
	
	shoot_fire.global_position = $Shoot/Direction.global_position
	get_tree().call_group("Mundo", "add_child", shoot_fire)
