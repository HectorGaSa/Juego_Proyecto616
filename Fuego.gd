extends StaticBody2D
var velocidad: int
var anim_fuego

# Called when the node enters the scene tree for the first time.
func _ready():
	anim_fuego = $AnimatedSprite2D
	anim_fuego.play("Disparo")

func _process(delta):
	global_position.x += velocidad * delta
	

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
