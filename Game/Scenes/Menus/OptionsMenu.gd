extends Node2D

onready var buttonBack = $Menu/VBoxContainer/Back
onready var masterLabel = $Menu/VBoxContainer/Master/MasterLabel
onready var masterSlide = $Menu/VBoxContainer/Master/Master
onready var soundEffectLabel = $"Menu/VBoxContainer/Sound effect/SoundEffectLabel"
onready var soundEffectSlide = $"Menu/VBoxContainer/Sound effect/SoundEffect"
onready var dialogueLabel = $Menu/VBoxContainer/Dialogue/DialogueLabel
onready var dialogueSlide = $Menu/VBoxContainer/Dialogue/Dialogue
onready var ambientLabel = $Menu/VBoxContainer/Ambient/AmbientLabel
onready var ambientSlide = $Menu/VBoxContainer/Ambient/Ambient
onready var musicLabel = $Menu/VBoxContainer/Music/MusicLabel
onready var musicSlide = $Menu/VBoxContainer/Music/Music


# Called when the node enters the scene tree for the first time.
func _ready():
	fix_antialiasing(buttonBack)
	fix_antialiasing(masterLabel)
	fix_antialiasing(soundEffectLabel)
	fix_antialiasing(dialogueLabel)
	fix_antialiasing(ambientLabel)
	fix_antialiasing(musicLabel)
	
	masterSlide.set_value(Global.get_masterVolume())
	soundEffectSlide.set_value(Global.get_soundEffectVolume())
	dialogueSlide.set_value(Global.get_dialogueVolume())
	ambientSlide.set_value(Global.get_ambientVolume())
	musicSlide.set_value(Global.get_musicVolume())



func fix_antialiasing(button):
	button.get_font("font").font_data.antialiased = false
	button.get_font("font").use_filter = true
	button.get_font("font").use_filter = false


func _on_Back_pressed():
	get_parent().switch_to_main_menu(self)


func _on_Master_value_changed(value): Global.change_master_volume(value)


func _on_SoundEffect_value_changed(value): Global.change_soundEffects_volume(value)



func _on_Dialogue_value_changed(value): Global.change_dialogue_volume(value)



func _on_Ambient_value_changed(value): Global.change_ambient_volume(value)


func _on_Music_value_changed(value): Global.change_music_volume(value)
