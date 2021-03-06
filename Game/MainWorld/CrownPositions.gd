extends Node2D

onready var quadrant0 = $Quadrant0
onready var quadrant1 = $Quadrant1
onready var quadrant2 = $Quadrant2
onready var quadrant3 = $Quadrant3


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func get_quadrant_position(quandrant_value):
	if quandrant_value == 0: return quadrant0.position
	if quandrant_value == 1: return quadrant1.position
	if quandrant_value == 2: return quadrant2.position
	if quandrant_value == 3: return quadrant3.position
