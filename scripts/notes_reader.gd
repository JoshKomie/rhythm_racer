extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var note_data = []
var note_scenes = {}
var audio
var timer
var input_range = 0.3

var queue_size = 10
var message
var car
var speed_label
var hits = []

var level1data = [
	{"type": 1, "time": 3.69},
	{"type": 1, "time": 5.53},
	{"type": 2, "time": 6.00},
	{"type": 3, "time": 6.46},
	{"type": 4, "time": 6.92},
	{"type": 1, "time": 7.38},
	{"type": 1, "time": 8.30},
	{"type": 2, "time": 9.23},
	{"type": 2, "time": 10.15},
	{"type": 3, "time": 11.07},
	{"type": 3, "time": 12.00},
	{"type": 4, "time": 12.92},
	{"type": 4, "time": 13.38},
	{"type": 4, "time": 13.84},
	{"type": 1, "time": 14.76},
	{"type": 2, "time": 15.23},
	{"type": 3, "time": 15.69},
	{"type": 3, "time": 16.61},
	{"type": 2, "time": 17.07},
	{"type": 1, "time": 17.53},
	{"type": 1, "time": 18.46},
	{"type": 2, "time": 18.92},
	{"type": 3, "time": 19.38},
	{"type": 4, "time": 19.84},
	{"type": 4, "time": 20.30},
	{"type": 4, "time": 20.65},
	{"type": 4, "time": 21.00},
	{"type": 1, "time": 22.15},
	{"type": 2, "time": 22.61},
	{"type": 3, "time": 23.07},
	{"type": 2, "time": 23.53},
	{"type": 2, "time": 24.46},
	{"type": 3, "time": 24.92},
	{"type": 2, "time": 25.38},
	{"type": 1, "time": 25.84},
	{"type": 2, "time": 26.30},
	{"type": 3, "time": 26.76},
	{"type": 2, "time": 27.23},
	{"type": 4, "time": 27.46},
	{"type": 4, "time": 27.69},
	{"type": 4, "time": 28.03},
	{"type": 4, "time": 28.38},
	{"type": 1, "time": 29.53},
	{"type": 2, "time": 29.53},
	{"type": 1, "time": 30.00},
	{"type": 2, "time": 30.00},
	{"type": 1, "time": 30.46},
	{"type": 2, "time": 30.46},
	{"type": 3, "time": 31.38},
	{"type": 4, "time": 31.38},
	{"type": 3, "time": 31.84},
	{"type": 4, "time": 31.84},
	{"type": 3, "time": 32.30},
	{"type": 4, "time": 32.30},
	{"type": 1, "time": 33.23},
	{"type": 4, "time": 34.50},
	{"type": 1, "time": 35.07},
	{"type": 4, "time": 35.07},
	{"type": 1, "time": 35.42},
	{"type": 4, "time": 35.42},
	{"type": 1, "time": 35.76},
	{"type": 4, "time": 35.76},
	{"type": 1, "time": 35.88},
	{"type": 4, "time": 35.88},
	{"type": 1, "time": 36.00},
	{"type": 4, "time": 36.00},
]

func _ready():
	set_process_input(true)
	audio = get_node("./../AudioStreamPlayer")
	timer = get_node("./../timer")
	message = get_node("./../../message")
	car = get_tree().get_root().find_node("car", true, false)
	speed_label = get_node("./../../../speed")
	print("sp=", speed_label)
	audio.play()
	note_scenes[1] = preload("res://scenes/note_1.tscn")
	note_scenes[2] = preload("res://scenes/note_2.tscn")
	note_scenes[3] = preload("res://scenes/note_3.tscn")
	note_scenes[4] = preload("res://scenes/note_4.tscn")
	
	#var file = File.new()
	#file.open("res://levels/test/notes.txt", file.READ)
	#while (!file.eof_reached()):
	#	var line = file.get_line()
	#	#print("line=", line)
	#	var words = line.split(" ")
	#	if (words.size() != 2):
	#		print("invalid line, skipping!")
	#		continue
	#	var key = float(words[0])
	#	var time = float(words[1])
	#	#print("key=", key, "time=", time)
	#	note_data.push_back({"type": key, "time": time})
	#file.close()
	note_data = level1data;
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
	for data in note_data:
		if current_time > data.time + input_range && !data.has("hit"):
			data["hit"] = false
			message.show_message("Miss")
			
			#set_speed()
			car.add_hit(false)
					
func custom_input(event):
	var current_time = audio.get_playback_position()
	var a = event.is_action_pressed("note1")
	var s = event.is_action_pressed("note2")
	var d = event.is_action_pressed("note3")
	var f = event.is_action_pressed("note4")
	for data in note_data:
		if current_time > data.time - input_range && current_time < data.time + input_range:
			if a && data.type == 1 || s && data.type == 2 || d && data.type == 3 || f && data.type == 4:
				message.show_message("Great!")
				hits.push_back(true)
				if hits.size() > queue_size:
					hits.pop_front()
				car.add_hit(true)
				data["hit"] = true


	
