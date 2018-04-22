extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var paths = [
		"res://sprites/track2_t1v2.png",
		"res://sprites/track2_t2v2.png",
		"res://sprites/track2_t3v2.png",
	]
	var i = randi() % 3
	var path = paths[i]
	set_texture(load(path))
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
