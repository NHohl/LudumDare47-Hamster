extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	update_lives()
	update_level()

func update_lives():
	get_node("VBoxContainer/LivesLabel").text = "Lives: " + str(Global.LIVES)

func update_level():
	get_node("VBoxContainer/LevelLabel").text = "Level: " + str(Global.FASE+1)
