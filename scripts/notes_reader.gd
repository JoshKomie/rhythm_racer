extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var note_data = []
var note_scenes = {}
var audio
var timer
var input_range = 0.5
var message

func _ready():
	set_process_input(true)
	audio = get_node("./../AudioStreamPlayer")
	timer = get_node("./../timer")
	message = get_node("./../message")
	audio.play()
	note_scenes[1] = preload("res://scenes/note_1.tscn")
	note_scenes[2] = preload("res://scenes/note_2.tscn")
	note_scenes[3] = preload("res://scenes/note_3.tscn")
	note_scenes[4] = preload("res://scenes/note_4.tscn")
	
	var file = File.new()
	file.open("res://levels/test/notes.txt", file.READ)
	while (!file.eof_reached()):
		var line = file.get_line()
		#print("line=", line)
		var words = line.split(" ")
		if (words.size() != 2):
			print("invalid line, skipping!")
			continue
		var key = float(words[0])
		var time = float(words[1])
		#print("key=", key, "time=", time)
		note_data.push_back({"type": key, "time": time})
	file.close()
	build_notes()
	
func build_notes():
	var parent = get_node("./notes_parent")
	for data in note_data:
		var note = note_scenes[int(data.type)].instance()
		note.target_time = data.time
		parent.add_child(note)
		note.position.x = data.type * 64
		note.position.y = -64
		#note.translate(Vector2(data.type * 64, data.time * 64 * -1))
	
func _process(delta):
	var current_time = audio.get_playback_position()
	timer.text = String(current_time)

					
func _input(event):
	var current_time = audio.get_playback_position()
	var a = event.is_action_pressed("note1")
	var s = event.is_action_pressed("note2")
	var d = event.is_action_pressed("note3")
	var f = event.is_action_pressed("note4")
	for data in note_data:
		if current_time > data.time - input_range && current_time < data.time + input_range:
			if a && data.type == 1 || s && data.type == 2 || d && data.type == 3 || d && data.type == 4:
				message.show_message("Great!")
