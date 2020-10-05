extends Node2D

export var ROTATION_DURATION = 3
export var LIVES = 100
var FASE = 0
var fases = [
	{
		"batidas":[2, 4,6, 8, 10],
		"bpm":80,
		"rotation_duration":3.0,
		"musica":load("res://Music/vai tomar no cu porra 3 segundo meu pinto.ogg")
	},
	{
#		"batidas":[3, 6, 9,12, 13, 14, 15, 18, 19],
		"batidas":range(1,50),
		"bpm":100,
		"rotation_duration":2.6,
		"musica":load("res://Music/batidas 100 bpm.ogg")
	}
]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
