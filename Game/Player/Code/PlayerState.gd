extends Node

class_name PlayerState

# Superclass (faux interface) common to all finite state machine / pushdown automata.

var player
var debugState

# Return the unique string name of the state. Must be overridden.
func get_name():
	assert(false)

# Handle any transitions into this state. Subclasses should first chain to this method.
func enter(player, debugState):
	self.player = player
	self.debugState = debugState

# Exit the current state, enter a new one.
func set_state(state):
	player.state.exit()
	player.state.queue_free()
	player.state = state
	state.enter(self.player, self.debugState)
	player.add_child(state)

# Handle input events.
func get_input():
	pass

func _physics_process(delta):
	pass

# Handle exit events.
func exit():
	pass
