extends Node2D

onready var camera = $Camera2D
onready var playButton = $Menu/VBoxContainer/HBoxContainer/MarginContainer/Play
onready var optionsButton = $Menu/VBoxContainer/HBoxContainer/MarginContainer/Options
onready var exitButton = $Menu/VBoxContainer/HBoxContainer/MarginContainer/Exit
onready var label = $Label

func _ready():
	fix_antialiasing(playButton)
	fix_antialiasing(optionsButton)
	fix_antialiasing(exitButton)
	
func _process(_delta):
	get_input()
	
func get_input():
	if Input.is_action_just_pressed("BACK"): get_tree().quit()
	if Input.is_action_just_pressed("ACCEPT"): get_parent().switch_to_main_world(self)

func fix_antialiasing(button):
	button.get_font("font").font_data.antialiased = false
	button.get_font("font").use_filter = true
	button.get_font("font").use_filter = false


func _on_Play_pressed(): get_parent().switch_to_initial(self)


func _on_Options_pressed(): get_parent().switch_to_options_menu(self)


func _on_Exit_pressed(): get_tree().quit()
