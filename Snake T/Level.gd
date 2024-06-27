extends Node2D

onready var gear = preload("res://Gear.tscn")
var score = 0

func _process(delta):
	$Score.text = "Points:" + (str(score))


func _ready():
	add_gear()
	
func add_gear():
	var instance = gear.instance()
	instance.position = Vector2(rand_range(500,50),rand_range(500,50))
	instance.connect("Gear_used",self,"spawn_new")
	add_child(instance)
	
func spawn_new():
	score =+5
	add_gear()
	get_node("Snake").add_tail()

