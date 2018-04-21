extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var track_piece = preload("res://scenes/track_pieces/snow_track.tscn")
	for i in range(30):
		var inst = track_piece.instance()
		add_child(inst)
		inst.position.y = -512 * i

		

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
