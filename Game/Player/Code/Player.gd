extends KinematicBody2D

var state
export var debug = false

################################
##Variable Setters and Getters##
################################

#state
func get_state(): return state
func set_state(newState):
	state = newState
	return state
	
#debug
func get_debug(): return debug
func set_debug(newDebug):
	debug = newDebug
	return debug

####################
##Engine Functions##
####################

func _ready():
	#Initialize States
	state = PlayerIdleState.new()
	state.enter(self, debug)
	add_child(state)
	
	
#input and changing state is handled by the states themselves
# Let the current state handle the processing logic; also handle the changing of states.
func _physics_process(delta):
	# Update the current state; handle switching.
	state.call("_physics_process", delta)
	
