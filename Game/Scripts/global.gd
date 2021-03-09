extends Node

#Volumes
var masterVolume  = db2linear(AudioServer.get_bus_volume_db(0))
var soundEffectVolume = db2linear(AudioServer.get_bus_volume_db(1))
var dialogueVolume = db2linear(AudioServer.get_bus_volume_db(2))
var ambientVolume = db2linear(AudioServer.get_bus_volume_db(3))
var musicVolume = db2linear(AudioServer.get_bus_volume_db(4))

var hasSeenIntro = false


var debug = false
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
	
func save_dict():
	var save_dict = {
		"masterVolume" : masterVolume,
		"soundEffectVolume" : soundEffectVolume,
		"dialogueVolume" : dialogueVolume,
		"ambientVolume" : ambientVolume,
		"musicVolume" : musicVolume,
		"hasSeenIntro" : hasSeenIntro,
	}
	return save_dict

func save_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	if debug:
		print("Saveing the Game:")
		print(save_dict())
	save_game.store_line(to_json(save_dict()))
	save_game.close()
	
func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return
	save_game.open("user://savegame.save", File.READ)
	
	var variable_data = parse_json(save_game.get_line())
	
	if debug:
		print("loading the game")
	for i in variable_data:
		if debug:
			print(i)
			print(variable_data[i])
		set(i, variable_data[i])
	
	save_game.close()
	
	#Should have thought about this
	update_all_volumes()
	
	
###################
##Volume Handling##
###################

func update_all_volumes():
	change_master_volume(masterVolume)
	change_ambient_volume(ambientVolume)
	change_dialogue_volume(dialogueVolume)
	change_music_volume(musicVolume)
	change_soundEffects_volume(soundEffectVolume)

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
