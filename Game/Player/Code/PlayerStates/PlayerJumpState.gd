extends PlayerState

class_name PlayerJumpState


var PlayerRunState  = load("res://Player/Code/PlayerStates/PlayerRunState.gd")
var PlayerIdleState = load("res://Player/Code/PlayerStates/PlayerIdleState.gd")


func get_name(): return "PlayerJumpState"
	
	
func enter(player, debugState):
	.enter(player, debugState)
	if debugState: print(get_name())
	
	player.reset_jumped_frames()
	player.jump_sound_effect()


func get_input():
	if Input.is_action_pressed("RIGHT"):
		player.turn_right()
		player.set_speedX(player.get_acellX()*Input.get_action_strength("RIGHT"), player.get_maxVelocityX())
	elif Input.is_action_pressed("LEFT"):
		player.turn_left()
		player.set_speedX(-player.get_acellX()*Input.get_action_strength("LEFT"), player.get_maxVelocityX())
	else:
		player.set_speedX(player.get_decellX(), 0, false, true)
	
	if Input.is_action_pressed("JUMP"): player.jump(true)
	else: player.state.set_state(PlayerFallState.new())
	
	if player.get_fireplace() and Input.is_action_just_pressed("INTERACT"): 
		player.star_interaction_start()

func _physics_process(_delta):
	#State Changes
	if player.is_on_floor():  player.land()
	
	player.apply_gravity_player()
	get_input()
	player.move_player()
