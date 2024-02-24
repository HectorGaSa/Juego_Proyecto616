extends CharacterBody2D

const Fuego = preload("res://Assets/Player/fuego.tscn")

var anim_player
var anim_sprite
var direction = Vector2.ZERO
var speed = 5  # Velocidad de movimiento
const Bullet = preload("res://Assets/Player/Bullet.gd")

func _ready():
	anim_player = $AnimatedSprite2D
	anim_sprite = get_node("Cabeza/AnimatedSprite2D")

	# Reproduce una animación en la escena hija

func _process(delta):
	move()

	# Lógica para detectar las pulsaciones de teclas y actualizar la dirección
func move():
	direction = Vector2.ZERO
	if Input.is_action_pressed("go_right"):
		direction.x += 1
	if Input.is_action_pressed("go_left"):
		direction.x -= 1
	if Input.is_action_pressed("go_down"):
		direction.y += 1
	if Input.is_action_pressed("go_up"):
		direction.y -= 1

	# Normalizar la dirección para evitar la velocidad diagonal más rápida
	direction = direction.normalized()

	# Mover el personaje en función de la dirección y la velocidad
	move_and_collide(direction * speed)
	
	# Lógica para reproducir las animaciones de movimiento
	if direction != Vector2.ZERO:
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				anim_player.play("Go_Right")
				anim_sprite.play("Look_Right")
			else:
				anim_player.play("Go_Left")
				anim_sprite.play("Look_Left")
		else:
			if direction.y > 0:
				anim_player.play("Go_Down")
				anim_sprite.play("Look_Down")
			else:
				anim_player.play("Go_Up")
				anim_sprite.play("Look_Up")
	else:
		# Si no hay movimiento, detén la animación
		anim_player.stop()
		anim_sprite.stop()


func shootFire():
	var shoot_fire = Fuego.instance()
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
