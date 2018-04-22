extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var _text = ""
var last_time = null
var hide = null
var elapsed = 0
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	elapsed += delta
	if hide && elapsed > hide:
		text = ""
		hide = null
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func show_message(message):
	last_time = elapsed
	text = message
	hide = elapsed + 0.5