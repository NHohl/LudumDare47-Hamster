extends Node2D

export var ROTATION_DURATION = 3
export var LIVES = 3
var FASE = 0
var fases = [
	{
		"batidas":[2, 4,6, 8, 10],
		"bpm":80,
		"musica":load("res://Music/vai tomar no cu porra 3 segundo meu pinto.ogg")
	},
	{
		"batidas":[3, 6, 9,12],
		"bpm":100,
		"musica":load("res://Music/Almost New.wav")
	}
]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
