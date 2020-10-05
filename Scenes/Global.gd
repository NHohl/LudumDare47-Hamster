extends Node2D

#export var ROTATION_DURATION = 3
export var LIVES = 3
var FASE = 0
var fases = [
	{
		"batidas":[12,16,20,24,28,32,36,40,44,48,52,56,60,64,68,72,76,80],
		"bpm":80,
		"rotation_duration":3.0,
		"musica":load("res://Music/musica level 1.ogg"),
		"song_duration":60
	},
	{
		"batidas":[13,17,21,25,29,33,37,41,45,49,53,57,61,65,69,73,77,81,85,89,93,97,101,105,109,113,117],
		"bpm":100,
		"rotation_duration":2.4,
		"musica":load("res://Music/musica level 2.ogg"),
		"song_duration":84
	},
	{
		"batidas":[26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,92,94,96,98,100,102,104,106,108,110,112,114,116,120,122,124,126,128,130,132,134,136,138,140,142,144,146,148,150,152,154,156,158,160],
		"bpm":120,
		"rotation_duration":2.0,
		"musica":load("res://Music/musica level 3.ogg"),
		"song_duration":161
	}
]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
