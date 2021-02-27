extends PlayerState

class_name PlayerIdleState


func getName():
	return "PlayerIdleState"
	
	
func enter(player, debugState):
	.enter(player, debugState)
	if debugState: print(getName())


func get_Input():
	pass


func _physics_process(_delta):
	pass
