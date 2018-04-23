extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var speed = 0
var track_low = -128
var track_high = 128
var hits = []
var base_speed = 100
var speed_per_hit = 15
var queue_size = 10
var speed_label
var flames
var speed_low = 140
var speed_high = 220

var flames_tex_low
var flames_tex_mid
var flames_tex_high
	
func _ready():
	speed=  0
	speed_label = get_node("./../../CanvasLayer/speed")
	speed_label.text = "Speed:" + String(speed)
	flames = get_node("./flames")
	flames_tex_low = preload("res://sprites/flame1.png")
	flames_tex_mid = preload("res://sprites/flame2.png")
	flames_tex_high = preload("res://sprites/flame3.png")
	 
func add_hit(val):
	hits.push_back(val)
	if (hits.size() > queue_size):
		hits.pop_front()
	var new_speed = base_speed
	for hit in hits:
		if hit:
			new_speed += speed_per_hit
	speed = new_speed
	speed_label.text = "Speed:" + String(speed)

func _process(delta):
	if speed > 0:
		translate(Vector2(0, -speed * delta))
	var mp = get_global_mouse_position()
	position.x = interpolate(position.x, mp.x, 0.1)
	if position.x < track_low:
		position.x = track_low
	if position.x > track_high:
		position.x = track_high
	
	if speed < speed_low:
		if flames.texture != flames_tex_low:
			flames.set_texture(flames_tex_low)
	elif speed >= speed_low && speed < speed_high:
		if flames.texture != flames_tex_mid:
			flames.set_texture(flames_tex_mid)
	else:
		if flames.texture != flames_tex_high:
			flames.set_texture(flames_tex_high)
	
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func interpolate(a, b, f):
	return a + f * (b - a);
