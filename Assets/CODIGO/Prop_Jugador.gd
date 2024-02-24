extends Node

# Definir las propiedades del jugador
var experiencia_actual : int = 0
var experiencia_necesaria_para_nivel_siguiente : int = 100
var nivel : int = 1
var clase_jugador : String = "Normal" # Clase inicial del jugador

# Definir las habilidades y ataques especiales por clase
var habilidades_por_clase = {
	"Normal": ["Instinto de Supervivencia", "Impulso Vital"],
	"Guerrero": ["Golpe Potente", "Furia guerrera"],
	"Mago": ["Bola de Fuego", "Rayo"],
	"Centinela": ["Defensa Reforzada", "Golpe de Escudo"],
	"Arquero": ["Disparo Preciso", "Lluvia de Flechas"],
	"Asesino": ["Golpe Mortal", "Sigilo"],
	"Alquimista": ["Lluvia de azufre", "Veneno relentizador"],
	# Agrega más clases y habilidades según sea necesario
}

# Método para agregar experiencia al jugador
func agregar_experiencia(experiencia_ganada : int):
	experiencia_actual += experiencia_ganada
	
	# Verificar si el jugador ha alcanzado suficiente experiencia para subir de nivel
	while experiencia_actual >= experiencia_necesaria_para_nivel_siguiente:
		experiencia_actual -= experiencia_necesaria_para_nivel_siguiente
		nivel += 1
		experiencia_necesaria_para_nivel_siguiente = calcular_experiencia_necesaria_para_nivel_siguiente(nivel)
		desbloquear_habilidades_nuevas()
		desbloquear_ataque_especial()

# Método para calcular la experiencia necesaria para el siguiente nivel
func calcular_experiencia_necesaria_para_nivel_siguiente(nivel_actual : int) -> int:
	return nivel_actual * 100

# Método para desbloquear nuevas habilidades basadas en el nivel y clase del jugador
func desbloquear_habilidades_nuevas():
	var habilidades_clase_actual = habilidades_por_clase[clase_jugador]
	for habilidad in habilidades_clase_actual:
		desbloquear_habilidad(habilidad)

# Método para desbloquear el ataque especial de la clase actual
func desbloquear_ataque_especial():
	var ataque_especial = "Ataque Especial " + clase_jugador
	desbloquear_habilidad(ataque_especial)

# Método para desbloquear una nueva habilidad
func desbloquear_habilidad(nombre_habilidad : String):
	# Lógica para desbloquear la habilidad
	print("¡Has desbloqueado la habilidad:", nombre_habilidad, "!")

# Método para cambiar la clase del jugador
func cambiar_clase(nueva_clase : String):
	clase_jugador = nueva_clase
	desbloquear_habilidades_nuevas()
	desbloquear_ataque_especial()
