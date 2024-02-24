extends Control

# Lista de objetos disponibles para tradeo
var objetos_disponibles := []
const Objeto = preload("res://Assets/CODIGO/Objeto.gd")

func _ready():
	var objeto = $Objeto
	# Agregar objetos disponibles
	var objeto1 = Objeto.new()
	objeto1.nombre = "Espada"
	objeto1.descripcion = "Una espada afilada"
	objeto1.rareza = 1
	objetos_disponibles.append(objeto1)

	var objeto2 = Objeto.new()
	objeto2.nombre = "Poción"
	objeto2.descripcion = "Una poción curativa"
	objeto2.rareza = 2
	objetos_disponibles.append(objeto2)

func realizar_tradeo(objeto_seleccionado: Objeto):
	# Lógica para realizar el tradeo
	# Aquí puedes implementar la validación de transacciones, actualizar inventarios, etc.
	pass
