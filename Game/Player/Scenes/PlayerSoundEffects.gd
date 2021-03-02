extends Node2D


onready var jumpSoundEffect = $JumpSoundEffect
onready var walkSoundEffect = $WalkSoundEffect
onready var walkSoundEffectTimer = $WalkSoundEffect/WalkSoundTimer


func _ready():
	pass # Replace with function body.


func play_jump_sound_effect(): jumpSoundEffect.play()
func play_walk_sound_effect(): 
	walkSoundEffect.play()
	walkSoundEffectTimer.start()
func stop_walk_sound_effect(): walkSoundEffectTimer.stop()
	
	
func _on_Timer_timeout():
	play_walk_sound_effect()
