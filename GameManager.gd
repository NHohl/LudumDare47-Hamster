extends Node2D

var bpm = Global.fases[Global.FASE]["bpm"]
var song_position = 0.0
var sec_per_beat = 60.0 / bpm
var contador = 0

var must_hit = Global.fases[Global.FASE]["batidas"]

var bar1 #tentei criar separadamente e depois usar append para colocar na lista bars
var bar2
var bar3
var bar4
var bars = []

func _ready():
#	var hamster = preload("res://Scenes/RotationController.tscn").instance()
#	get_node("../Wheel").add_child(hamster)
	bars.append(get_node("../Wheel/Barra1"))
	bars.append(get_node("../Wheel/Barra2"))
	bars.append(get_node("../Wheel/Barra3"))
	bars.append(get_node("../Wheel/Barra4"))
#	print(bars)
	
func _on_Conductor_beat(position):
#	contador+= 1
#	print("contador do gamemanager = ",contador)
	if position+2 in must_hit:
#		print("acender agora")
		bars[(position+3)%4].activate() #essa linha tá mandando a barra 4 mudar de cor e está funcionando, mas preciso escolher qual barra vai mudar
	if position >= Global.fases[Global.FASE]["song_duration"] and Global.LIVES >0:
		next_level()

func _process(delta):
	if Global.LIVES <= 0:
		game_over()
	if Input.is_action_just_pressed("next_level"):
		next_level()
#	print("FASE = ", Global.FASE)
		
func game_over():
	get_node("../Conductor").stop()
	get_node("../Wheel/RotationController").is_alive = false



func next_level():
	Global.FASE+=1
	print("FASE = ", Global.FASE)
	if Global.FASE < len(Global.fases):
		get_node("../Interface").update_level()
		get_tree().change_scene("res://Scenes/Main.tscn")
	else:
		Global.FASE = 0
		get_tree().change_scene("res://Scenes/TitleScreen.tscn")
