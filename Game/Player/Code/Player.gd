extends KinematicBody2D

var state
export var debug = false
var PlayerIdleState = load("res://Player/Code/PlayerStates/PlayerIdleState.gd")


#movement
const UP = Vector2(0, -1)
var velocity = Vector2.ZERO

#Horizontal Movement
export var acellX = 100
export var maxVelocityX = 250
export var decellX = 0.5

#Vertical Movement
export var grav  = 10
export var maxVelocityY = 100
export var jumpForce = -200
export var maxJumpFrames = 15
var jumpedFrames = 0
export var maxJumps = 1
var jumps = maxJumps + 1



#Components
onready var sprite = $PlayerSprite
onready var camera = $PlayerCamera
onready var collider = $PlayerCollider

################################
##Variable Setters and Getters##
################################

#UP
func get_UP(): return UP

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
	
#velocity
func get_velocity(): return velocity
func set_velocity(newVelocity):
	velocity = newVelocity
	return velocity
	
#acellX
func get_acellX(): return acellX
func set_acellX(newAcellX):
	acellX = newAcellX
	return acellX
	
#decellX
func get_decellX(): return decellX
func set_decellX(newDecellX):
	decellX = newDecellX
	return decellX

#maxVelocityX
func get_maxVelocityX(): return maxVelocityX
func set_maxVelocityX(newMaxVelocityX):
	maxVelocityX = newMaxVelocityX
	return maxVelocityX
	
#grav
func get_grav(): return grav
func set_grav(newGrav):
	grav = newGrav
	return grav
	
#maxVelocityY
func get_maxVelocityY(): return maxVelocityY
func set_maxVelocityY(newMaxVelocityY):
	maxVelocityY = newMaxVelocityY
	return maxVelocityY
	
#jumpForce
func get_jumpForce(): return jumpForce
func set_jumpForce(newJumpForce):
	jumpForce = newJumpForce
	return jumpForce
	
#maxJumpFrames
func get_maxJumpFrames(): return maxJumpFrames
func set_maxJumpFrames(newMaxJumpFrames):
	maxJumpFrames = newMaxJumpFrames
	return maxJumpFrames
	
#jumpedFrames
func get_jumpedFrames(): return jumpedFrames
func set_jumpedFrames(newJumpedFrames):
	jumpedFrames = newJumpedFrames
	return jumpedFrames
	
#maxJumps
func get_maxJumps(): return maxJumps
func set_maxJumps(newMaxJumps):
	maxJumps = newMaxJumps
	return maxJumps
	
#jumps
func get_jumps(): return jumps
func set_jumps(newJumps):
	jumps = newJumps
	return jumps
	
#sprite
func get_sprite(): return sprite
func set_sprite(newSprite): 
	sprite = newSprite
	return sprite
	
#camera
func get_camera(): return camera
func set_camera(newCamera):
	camera = newCamera
	return camera
	
#collider
func get_collider(): return collider
func set_collider(newCollider):
	collider = newCollider
	return collider

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

############
##Movement##
############

func move_player():
	set_velocity(move_and_slide(get_velocity(), get_UP()))
	
	
func apply_gravity_player(multiplier=1):
	set_speedY(grav*multiplier, maxVelocityY*multiplier)
	
	
func jump(fallthrough=false):
	print(jumps)
	if !fallthrough:
		if jumps:
			jumps -= 1
			set_speedY(jumpForce, 0, false)
			state.set_state(PlayerJumpState.new())
	else:
		set_speedY(jumpForce)
		jumpedFrames += 1
		if jumpedFrames >= maxJumpFrames:
			reset_jumped_frames()
			state.set_state(PlayerFallState.new())
		
				
func reset_jumps(): set_jumps(maxJumps + 1)
func reset_jumped_frames(): set_jumpedFrames(0)
	
	
func set_speedX(value, maxValue=0, adding=true, gradual=false):
	if!gradual:
		if adding: 
			velocity.x += value
		else: velocity.x = value
		
		if maxValue: velocity.x = clamp(velocity.x, -maxValue, maxValue)
	else: velocity.x = lerp(velocity.x, maxValue, value)
	return velocity
	
	
func set_speedY(value, maxValue=0, adding=true, gradual=false):
	if !gradual:
		if adding: 
			velocity.y += value
		else: velocity.y = value
		
		if maxValue: velocity.y = clamp(velocity.y, -maxValue, maxValue)
	else: velocity.y = lerp(velocity.y, maxValue, value)
	return velocity

#######################
##Animation Handling##
######################

func is_sprite_flipped(): return sprite.flip_h
	
func flip_sprite(): sprite.flip_h = not sprite.flip_h

func turn_right():
	if is_sprite_flipped(): flip_sprite()

func turn_left():
	if not is_sprite_flipped(): flip_sprite()
