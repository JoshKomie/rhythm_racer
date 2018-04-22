extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Area2D_area_entered(area):
	get_node("./../Particles2D").emitting = true
	var car = area.get_node("../")
	car.add_hit(false)
	car.add_hit(false)
	car.add_hit(false)
	
	#get_node("./../").queue_free()
	get_node("./../Sprite").queue_free()
	queue_free()
