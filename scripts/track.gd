extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var track_piece
func _ready():
	var snow_track = preload("res://scenes/track_pieces/snow_track.tscn")
	var dirt_track = preload("res://scenes/track_pieces/dirt_track.tscn")
	if global.level == 1:
		track_piece = dirt_track
	else:
		track_piece = snow_track
	var obstacle_scene = preload("res://scenes/obstacle.tscn")
	for i in range(60):
		var inst = track_piece.instance()
		add_child(inst)
		inst.position.y = -508 * i
		
	for i in range(80):
		if randi() % 10 > 1:
			var inst = obstacle_scene.instance()
			add_child(inst)
			inst.position.y = -200 + -256 * i + (randi() % 50)
			inst.position.x = -128 + randi() % 256
	print("root=", get_tree().root)
	var bg = get_node("./../../background")
	print("bg=", bg)
	if global.level == 1:
		bg.color = Color(0.648,0.964,0.367,1.0)
		#VisualServer.set_default_clear_color(Color(0.648,0.964,0.367,1.0))
	elif global.level == 2:
		bg.color = Color(0.882,0.945,0.941,1.0)
		#VisualServer.set_default_clear_color(Color(0.882,0.945,0.941,1.0))
		
	

		

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
