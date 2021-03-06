extends PlayerState

class_name PlayerRunState

var PlayerIdleState = load("res://Player/Code/PlayerStates/PlayerIdleState.gd")

func get_name():
	return "PlayerRunState"


func enter(player, debugState):
	.enter(player, debugState)
	if debugState: print(get_name())
	
	player.reset_jumps()
	player.walk_sound_effect()
	player.play_running_animation()


func get_input():
	if Input.is_action_pressed("RIGHT"):
		player.turn_right()
		player.set_speedX(player.get_acellX()*Input.get_action_strength("RIGHT"), player.get_maxVelocityX())
	elif Input.is_action_pressed("LEFT"):
		player.turn_left()
		player.set_speedX(-player.get_acellX()*Input.get_action_strength("LEFT"), player.get_maxVelocityX())
	else:
		player.state.set_state(PlayerIdleState.new())
		player.set_speedX(player.get_decellX(), 0, false, true)
		
	if Input.is_action_just_pressed("JUMP"): player.jump()
	
	if player.get_fireplace() and Input.is_action_just_pressed("INTERACT"): player.state.set_state(PlayerFireplaceState.new())
	

func exit():
	player.stop_walk_sound_effect()
	
	
func _physics_process(_delta):
	#State Changes
	if !player.is_on_floor(): player.state.set_state(PlayerFallState.new())
	
	player.apply_gravity_player()
	get_input()
	player.move_player()
