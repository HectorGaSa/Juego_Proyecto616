extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func get_input():
	# Add these actions in Project Settings -> Input Map.
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	# "Muzzle" is a Marker2D placed at the barrel of the gun.
	var b = $Bullet.instantiate()
	var bullet_direction = (get_global_mouse_position() - global_position).normalized()
	b.start($Muzzle.global_position, bullet_direction)
	get_tree().root.add_child(b)

func _process(delta):
	# Lógica para detectar las pulsaciones de teclas y actualizar la dirección
	get_input()
	var dir = get_global_mouse_position() - global_position
	# Don't move if too close to the mouse pointer.
	if dir.length() > 5:
		rotation = dir.angle()
		move_and_slide()


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
