extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var paths = [
		"res://sprites/snow_track/track_t1.png",
		"res://sprites/snow_track/track_t2.png",
		"res://sprites/snow_track/track_t3.png",
		"res://sprites/snow_track/track_t4.png",
	]
	var i = randi() % 4
	var path = paths[i]
	set_texture(load(path))
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
