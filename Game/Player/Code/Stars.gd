extends Node2D


var fireplace


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func start_interaction(fireplaceLocation):
	fireplace = fireplaceLocation
	get_parent().play_starSkyFadeIn_animation()

func dialogue_start():
	if fireplace == 0: #Middle
		print("Middle")
	elif fireplace == 1: #Right
		print("Right")
	elif fireplace == 2: #Left
		print("Left")
	
	get_parent().play_starSkyFadeOut_animation()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "StarSkyFadeIn": dialogue_start()
	elif anim_name == "StarSkyFadeOut": get_parent().star_interaction_finished()
