extends CharacterBody2D
class_name  Enemigo

var direction = Vector2.ZERO
var velocidad = 10  # Velocidad de movimiento del enemigo
var distancia_minima = 50  # Distancia mínima a la que el enemigo comenzará a seguir al jugador
var vida = 100
var daño = 10
var anim_enemy

func _ready():
	anim_enemy = $AnimatedSprite2D
	self.add_to_group("enemigo")

func move():
	direction = Vector2.ZERO
	if direction != Vector2.ZERO:
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				anim_enemy.play("go_right")
			else:
				anim_enemy.play("go_left")
		else:
			if direction.y > 0:
				anim_enemy.play("go_down")
			else:
				anim_enemy.play("go_up")
	else:
		anim_enemy.stop()
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				anim_enemy.play("static_right")
			else:
				anim_enemy.play("static_left")
		else:
			if direction.y > 0:
				anim_enemy.play("static_down")
			else:
				anim_enemy.play("static_up")
		# Si no hay movimiento, detén la animación

func recibir_daño(cantidad_de_daño):
	vida -= cantidad_de_daño
	if vida <= 0:
		queue_free()


#func _on_area_2d_body_entered(body):
#	if body.is_in_group("jugador"):
#		body.recibir_daño(daño)
#	if body.is_in_group("fuego"):
#		recibir_daño(body.daño)


func _on_area_2d_area_entered(area):
	if area.is_in_group("jugador"):
		area.recibir_daño(daño)
		print(area.vida)
	if area.is_in_group("fuego"):
		recibir_daño(area.daño)
		print(vida)
		area.queue_free()
