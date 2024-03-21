extends Node2D

var player_scene = preload("res://Assets/Player/Jugador.tscn")
var enemy_scene = preload("res://Assets/Enemigo/Enemigo.tscn")
var player
var enemy
var enemy_animated_sprite
var right_wall
var left_wall
var up_wall
var down_wall

func _ready():
	right_wall = self.get_node("Escenario/StaticBody2D/Right Wall")
	left_wall = self.get_node("Escenario/StaticBody2D/Left Wall")
	up_wall = self.get_node("Escenario/StaticBody2D/Up Wall")
	down_wall = self.get_node("Escenario/StaticBody2D/Down Wall")
	player = player_scene.instantiate()
	self.add_child(player)
	player.position = Vector2(100, 100)
	enemy = enemy_scene.instantiate()
	self.add_child(enemy)
	enemy.position = Vector2(150, 100)
	right_wall.add_to_group("walls")
	left_wall.add_to_group("walls")
	up_wall.add_to_group("walls")
	down_wall.add_to_group("walls")
	
	
	enemy_animated_sprite = enemy.get_node("AnimatedSprite2D")

func _process(delta):
	# Calcula la dirección hacia la que debe moverse el enemigo
	var direction = (player.global_position - enemy.global_position).normalized()
	enemy.position += direction * enemy.velocidad * delta
	if direction != Vector2.ZERO:
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				enemy_animated_sprite.play("go_right")
			else:
				enemy_animated_sprite.play("go_left")
		else:
			if direction.y > 0:
				enemy_animated_sprite.play("go_down")
			else:
				enemy_animated_sprite.play("go_up")
	else:
		enemy.stop()
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				enemy_animated_sprite.play("static_right")
			else:
				enemy_animated_sprite.play("static_left")
		else:
			if direction.y > 0:
				enemy_animated_sprite.play("static_down")
			else:
				enemy_animated_sprite.play("static_up")
		# Si no hay movimiento, detén la animación
	# Mueve al enemigo hacia el jugador




