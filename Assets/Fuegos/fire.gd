extends AnimatedSprite2D

var anim_fuego
var direction = Vector2.DOWN
var speed = 20
var daño = 10

func _ready():
	self.add_to_group("fuego")

func _process(delta):
	if abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			self.play("Disparo")
		else:
			self.play("Disparo")
	else:
		if direction.y > 0:
			self.play("Disparo")
		else:
			self.play("Disparo")
	global_position.x += speed * delta * direction.x
	global_position.y += speed * delta * direction.y
	

func _on_visible_on_screen_enabler_2d_screen_exited():
	self.queue_free()



func _on_area_2d_area_entered(area):
	if area.is_in_group("walls"):
		self.queue_free()
		
