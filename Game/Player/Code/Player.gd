extends KinematicBody2D

var state
export var debug = false

func _ready():
	state = PlayerIdleState.new()
	state.enter(self, debug)
	add_child(state)
	
