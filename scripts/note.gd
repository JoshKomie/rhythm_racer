extends Sprite

var target_y = 500.0
var start_y = -20
var target_time
var start_time
var audio
func _ready():
	target_time = float(target_time)
	start_time = target_time - 3

func _process(delta):
	var current_time = audio.get_playback_position()
	if (current_time > start_time):
		var percent = (current_time - start_time) / (target_time - start_time )
		var new_y = interpolate(start_y, target_y, percent)
		position.y = new_y
		print("new_y=", new_y)
		
	
func interpolate(a, b, f):
	return a + f * b
	
func hide():
	pass
