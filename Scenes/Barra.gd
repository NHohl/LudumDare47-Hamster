extends Area2D

var is_hittable = false
var was_hit = false
var is_hamster_in = false



func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
#	check_hit()
	pass

func activate():
#	print("activate was called")
	was_hit = false
	is_hittable = true
	$Sprite.self_modulate = Color(0, 1, 0)
	
func _input(event):
	if event.is_action_pressed("hit"):
		if is_hittable and is_hamster_in:
			was_hit = true
			is_hittable = false
			$Sprite.self_modulate = Color(1, 1, 1)
			if Global.LIVES < 3:
				Global.LIVES += 1
				get_node("../../Interface").update_lives()
				print("Lives = ", Global.LIVES)
	


func miss():
	print("Deu miss")
	play_miss()
	$Sprite.self_modulate = Color(1, 0, 0)
	$Timer.start()
	Global.LIVES -=1
	get_node("../../Interface").update_lives()
	print("Lives = ", Global.LIVES)
	
func play_miss():
	get_node("../../MissEffect").play()
	print("Tried to play miss sound")


func _on_Barra_body_entered(body):
	is_hamster_in = true



func _on_Barra_body_exited(body):
	is_hamster_in = false
	if is_hittable and !was_hit:
		miss()
	is_hittable = false


func _on_Timer_timeout():
	$Sprite.self_modulate = Color(1, 1, 1)
