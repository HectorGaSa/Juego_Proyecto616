extends CharacterBody2D

var fuego = preload("res://Assets/Fuegos/Fire.tscn")
@onready var shoot : Marker2D = $Shoot
var anim_player
var direction = Vector2.ZERO


func _ready():
	anim_player = $AnimatedSprite2D

func _process(delta):
	move(delta)

func move(delta):
	direction = Vector2.ZERO
	
	if Input.is_action_pressed("shoot_right"):
		direction = Vector2.RIGHT
		anim_player.play("Look_Right")
		shoot.set_position(Vector2(12,0))
		shootFire(delta, direction)
		anim_player.stop()
		
	if Input.is_action_pressed("shoot_left"):
		direction = Vector2.LEFT
		anim_player.play("Look_Left")
		shoot.set_position(Vector2(-12,0))
		shootFire(delta, direction)
		anim_player.stop()
		
	if Input.is_action_pressed("shoot_down"):
		direction = Vector2.DOWN
		anim_player.play("Look_Down")
		shoot.set_position(Vector2(0,12))
		shootFire(delta, direction)
		anim_player.stop()
		
	if Input.is_action_pressed("shoot_up"):
		direction = Vector2.UP
		anim_player.play("Look_Up")
		shoot.set_position(Vector2(0,-12))
		shootFire(delta, direction)
		anim_player.stop()

func shootFire(delta, direction):
	
	var shoot_fire = fuego.instantiate() as Node2D
	print(shoot.get_position())
	
	shoot_fire.global_position = shoot.get_position() * direction
	print(shoot_fire.global_position)

	shoot_fire.direction = direction

	# Add the shoot node to the scene tree
	get_parent().add_child(shoot_fire)
	
	# Print a message to the console
	print("Shoot")
