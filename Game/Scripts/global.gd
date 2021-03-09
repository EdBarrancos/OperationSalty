extends Node

#Volumes
var masterVolume  = db2linear(AudioServer.get_bus_volume_db(0))
var soundEffectVolume = db2linear(AudioServer.get_bus_volume_db(1))
var dialogueVolume = db2linear(AudioServer.get_bus_volume_db(2))
var ambientVolume = db2linear(AudioServer.get_bus_volume_db(3))
var musicVolume = db2linear(AudioServer.get_bus_volume_db(4))

var hasSeenIntro = false

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
	
func get_dialogueVolume(): return dialogueVolume
func set_dialogueVolume(newDialogueVolume):
	dialogueVolume = newDialogueVolume
	return dialogueVolume
	
func get_ambientVolume(): return ambientVolume
func set_ambientVolume(newAmbientSound):
	ambientVolume = newAmbientSound
	return ambientVolume

func get_musicVolume(): return musicVolume
func set_musicvolume(newMusicSound):
	musicVolume = newMusicSound
	return musicVolume
	
func get_hasSeen_intro(): return hasSeenIntro
func set_hasSeen_intro(newHasSeenIntro):
	hasSeenIntro = newHasSeenIntro
	return hasSeenIntro


####################
##Engine Functions##
####################

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
	
func save():
	pass
	
func load():
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
	
func change_dialogue_volume(value):
	AudioServer.set_bus_volume_db(2, linear2db(value))
	dialogueVolume = value
	
func change_ambient_volume(value):
	AudioServer.set_bus_volume_db(3, linear2db(value))
	ambientVolume = value

func change_music_volume(value):
	AudioServer.set_bus_volume_db(4, linear2db(value))
	musicVolume = value
