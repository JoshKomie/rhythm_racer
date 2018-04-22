extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var notes_reader
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process_input(true)
	notes_reader = get_node("./music_panel/music_area/notes_reader")
	
func _input(event):
	notes_reader.custom_input(event)
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func set_difficulty(button_pressed):
	if button_pressed:
		global.mode = "hard"
	else:
		global.mode = "easy"


func main_menu():
	get_tree().change_scene("res://scenes/menu.tscn")
