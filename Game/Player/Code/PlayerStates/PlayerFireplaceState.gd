extends PlayerState

class_name PlayerFireplaceState

var PlayerRunState  = load("res://Player/Code/PlayerStates/PlayerRunState.gd")


func get_name(): return "PlayerFireplaceState"
	
	
func enter(player, debugState):
	.enter(player, debugState)
	if debugState: print(get_name())


func get_input():
	#Temporary
	#if Input.is_action_just_pressed("INTERACT"): player.state.set_state(PlayerIdleState.new())
	pass


func _physics_process(_delta):
	get_input()
