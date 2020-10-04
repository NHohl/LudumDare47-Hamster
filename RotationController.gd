extends Node2D


export var radius = Vector2.ONE * 180
var hamster = []
var orbit_angle_offset = PI / 2 # Angle that first platform will orbit around controller
var sprite
var sprite_rotation = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	find_hamster()
	sprite = hamster[0].get_child(1)
	
func _physics_process(delta):
	orbit_angle_offset += 2 * PI * delta / float(Global.ROTATION_DURATION)
	# Wrap the angle to keep it nice and tidy, and to prevent unlikely overflow
	orbit_angle_offset = wrapf(orbit_angle_offset, -PI, PI)
	sprite_rotation += 360 * delta / float(Global.ROTATION_DURATION)
	move_hamster()
	rotate_sprite()

func move_hamster():
	var new_position = Vector2()
	new_position.x = cos(orbit_angle_offset) * radius.x
	new_position.y = sin(orbit_angle_offset) * radius.y
	hamster[0].position = new_position
	
func find_hamster():
	# Reset the array, otherwise we'll just keep piling on platforms
	hamster = []
	for child in get_children():
		hamster.append(child)

func rotate_sprite():
	sprite.rotation_degrees = sprite_rotation
	
