extends PlayerState

class_name PlayerIdleState


var PlayerRunState  = load("res://Player/Code/PlayerStates/PlayerRunState.gd")


func get_name():
	return "PlayerIdleState"
	
	
func enter(player, debugState):
	.enter(player, debugState)
	if debugState: print(get_name())


func get_input():
	if Input.is_action_pressed("RIGHT"):
		player.turn_right()
		player.state.set_state(PlayerRunState.new())
	elif Input.is_action_pressed("LEFT"):
		player.turn_left()
		player.state.set_state(PlayerRunState.new())
	else: player.set_speedX( player.get_decellX(), 0, false, true)


func _physics_process(_delta):
	get_input()
	player.move_player()

