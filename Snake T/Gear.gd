extends Area2D

signal Gear_used

func _ready():
	pass # Replace with function body.



func _on_Gear_area_entered(area):
	if(area.name == "Head"):
		queue_free()
		emit_signal("Gear_used")
