extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var track_piece = preload("res://scenes/track_pieces/snow_track.tscn")
	var obstacle_scene = preload("res://scenes/obstacle.tscn")
	for i in range(30):
		var inst = track_piece.instance()
		add_child(inst)
		inst.position.y = -510 * i
		
	for i in range(60):
		if randi() % 10 > 1:
			var inst = obstacle_scene.instance()
			add_child(inst)
			inst.position.y = -256 * i + (randi() % 50)
			inst.position.x = -128 + randi() % 128
	

		

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
