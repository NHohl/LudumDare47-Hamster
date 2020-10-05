extends Node2D

var hamster_node = preload("res://Scenes/Hamster.tscn").instance()
export var radius = Vector2.ONE * 180
var hamster = []
var orbit_angle_offset = PI / 2 # Angle that first platform will orbit around controller
var sprite
var sprite_rotation = 0
var is_alive = false
var rotation_duration = Global.fases[Global.FASE]["rotation_duration"]
#var rotation_duration = 3.0
# Called when the node enters the scene tree for the first time.
func _ready():
	find_hamster()
	sprite = hamster[0].get_child(1)
	
func _physics_process(delta):
	if is_alive:
		orbit_angle_offset += 2 * PI * delta / rotation_duration
		# Wrap the angle to keep it nice and tidy, and to prevent unlikely overflow
		orbit_angle_offset = wrapf(orbit_angle_offset, -PI, PI)
		sprite_rotation += 360 * delta / rotation_duration
	move_hamster()
	rotate_sprite()

func move_hamster():
	if get_node("../../Conductor").is_playing():
		if is_alive:
			var new_position = Vector2()
			new_position.x = cos(orbit_angle_offset) * radius.x
			new_position.y = sin(orbit_angle_offset) * radius.y
			hamster[0].position = new_position
	
func find_hamster():
	hamster = []
	for child in get_children():
		hamster.append(child)
	print("hamster = ", hamster)

func rotate_sprite():
	sprite.rotation_degrees = sprite_rotation
	
func reset_hamster():
	rotation_duration = Global.fases[Global.FASE]["rotation_duration"]
	get_node("Hamster").queue_free()
	is_alive = false
	add_child(hamster_node)
	find_hamster()
	sprite = hamster[Global.FASE].get_child(1)
	is_alive = true
