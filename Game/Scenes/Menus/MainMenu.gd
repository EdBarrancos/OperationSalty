extends Node2D


func _ready():
	pass
	
func _process(_delta):
	get_input()
	
func get_input():
	if Input.is_action_just_pressed("ACCEPT"): get_parent().switch_to_main_world(self)
