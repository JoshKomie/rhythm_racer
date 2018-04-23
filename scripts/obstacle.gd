extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var level1paths = ["res://sprites/cone.png"]
	var level2paths = ["res://sprites/snowman1.png", "res://sprites/snowman2.png"]
	var path = null
	if global.level == 1:
		path = level1paths[0]
	elif global.level == 2:
		path = level2paths[randi() % 2]
	if path:
		var texture = load(path)
		get_node("../Sprite").set_texture(texture)


func _on_Area2D_area_entered(area):
	get_node("./../Particles2D").emitting = true
	var car = area.get_node("../")
	car.add_hit(false)
	car.add_hit(false)
	car.add_hit(false)
	
	#get_node("./../").queue_free()
	get_node("./../Sprite").queue_free()
	queue_free()
