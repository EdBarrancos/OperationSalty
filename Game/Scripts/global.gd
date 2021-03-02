extends Node

#Volumes
var masterVolume  = db2linear(AudioServer.get_bus_volume_db(0))
var soundEffectVolume = db2linear(AudioServer.get_bus_volume_db(1))


#######################
##Getters and Setters##
#######################

#masterVolume
func get_masterVolume(): return masterVolume
func set_masterVolume(newMasterVolume):
	masterVolume = newMasterVolume
	return masterVolume
	
#soundEffectVolume
func get_soundEffectVolume(): return soundEffectVolume
func set_soundEffectVolume(newSoundEffectVolume):
	soundEffectVolume = newSoundEffectVolume
	return soundEffectVolume

####################
##Engine Functions##
####################

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
###################
##Volume Handling##
###################

func change_master_volume(value):
	AudioServer.set_bus_volume_db(0, linear2db(value))
	masterVolume = value
	
func change_soundEffects_volume(value):
	AudioServer.set_bus_volume_db(1, linear2db(value))
	soundEffectVolume = value
