extends Area2D

var is_hittable = false
var was_hit = false



func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Barra_body_entered(body):
	was_hit = true
	
