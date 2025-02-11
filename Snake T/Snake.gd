extends Node2D

var direction = Vector2(5,0)
var gap = -7
var next_tail_gap = Vector2(1,0)
var prev_tail = Vector2(1,0)
onready var tail = preload("res://Tail.tscn")

func _ready():
	pass # Replace with function body.

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _process(delta):
	if(Input.is_action_just_pressed("ui_up")):
		direction = Vector2(0,-5)
	elif(Input.is_action_just_pressed("ui_down")):
		direction = Vector2(0,5)
	elif(Input.is_action_just_pressed("ui_left")):
		direction = Vector2(-5,0)
	elif(Input.is_action_just_pressed("ui_right")):
		direction = Vector2(5,0)
	move_snake()
	
		
func move_snake():
	var head_position = get_node("Head").position
	get_node("Head").position += direction/2
	
	var prev_dir = direction
	var dir_change = false
	if(prev_dir != direction):
		prev_dir = direction
		dir_change = true
	if(dir_change == true):
		for i in range(1, get_child_count()):
			get_child(i).add_to_group(head_position,direction)
	
	
func add_tail():
	var instance = tail.instance()
	var prev_tail = get_child(get_child_count()-1)
	if prev_tail.name !="Head":
		instance.cur_dir = prev_tail.cur_dir
		for i in range(0, prev_tail.pos_array.size()):
			instance.pos_array.append(prev_tail.pos_array[i])
			instance.directions.append(prev_tail.directions[i])
			instance.position = prev_tail.position + prev_tail.cur_dir * gap
	else:
		instance.cur_dir = direction
		instance.position = prev_tail.position + direction * gap
	add_child(instance)
			
