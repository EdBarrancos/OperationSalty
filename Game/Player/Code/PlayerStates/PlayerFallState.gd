extends PlayerState

class_name PlayerFallState


var PlayerRunState  = load("res://Player/Code/PlayerStates/PlayerRunState.gd")
var PlayerIdleState = load("res://Player/Code/PlayerStates/PlayerIdleState.gd")
var PlayerJumpState = load("res://Player/Code/PlayerStates/PlayerJumpState.gd")

func get_name():
	return "PlayerFallState"
	
	
func enter(player, debugState):
	.enter(player, debugState)
	if debugState: print(get_name())


func get_input():
	if Input.is_action_pressed("RIGHT"):
		player.turn_right()
		player.set_speedX(player.get_acellX()*Input.get_action_strength("RIGHT"), player.get_maxVelocityX())
	elif Input.is_action_pressed("LEFT"):
		player.turn_left()
		player.set_speedX(-player.get_acellX()*Input.get_action_strength("LEFT"), player.get_maxVelocityX())
	else:
		player.set_speedX(player.get_decellX(), 0, false, true)
		
	if Input.is_action_just_pressed("JUMP"): player.jump()
	
	if player.get_fireplace() and Input.is_action_just_pressed("INTERACT"): player.state.set_state(PlayerFireplaceState.new())


func _physics_process(_delta):
	#State Changes
	if player.is_on_floor(): player.land()
	
	player.apply_gravity_player()
	get_input()
	player.move_player()
