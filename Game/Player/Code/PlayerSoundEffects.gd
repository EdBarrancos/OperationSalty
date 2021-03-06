extends Node2D


onready var jumpSoundEffect = $JumpSoundEffect
onready var walkSoundEffect = $WalkSoundEffect
onready var landSoundEffect = $LandSoundEffect


func _ready():
	pass # Replace with function body.


######################
##Play Sound Effects##
######################

func play_jump_sound_effect(): jumpSoundEffect.play()


func play_walk_sound_effect(): walkSoundEffect.play()
	

func play_land_sound_effect(): landSoundEffect.play()
	
######################
##Stop Sound Effects##
######################

func stop_walk_sound_effect(): walkSoundEffect.stop()
	
####################
##Signal treatment##
####################
