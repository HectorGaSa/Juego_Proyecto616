extends AnimatedSprite2D

var anim_fuego
var direction = Vector2.DOWN
var speed = 5



func _process(delta):
	global_position.x += speed * delta * direction.x
	global_position.y += speed * delta * direction.y
	

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()

