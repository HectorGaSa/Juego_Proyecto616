extends Node2D

var player_scene = preload("res://Assets/Player/Jugador.tscn")

func _ready():
	var player = player_scene.instantiate()
	add_child(player)
	player.position = Vector2(100, 100)
	
	




