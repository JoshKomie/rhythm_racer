extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var speed = 100
var track_low = -128
var track_high = 128
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	translate(Vector2(0, -speed * delta))
	var mp = get_global_mouse_position()
	position.x = interpolate(position.x, mp.x, 0.1)
	if position.x < track_low:
		position.x = track_low
	if position.x > track_high:
		position.x = track_high
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func interpolate(a, b, f):
	return a + f * (b - a);
