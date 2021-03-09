extends Node2D

onready var victoryScene = load("res://Scenes/Victory.tscn")
onready var defeatScene = load("res://Scenes/Defeat.tscn")
onready var mainWorld = load("res://MainWorld/GameLevel1.tscn")
onready var mainMenu = load("res://Scenes/Menus/MainMenu.tscn")
onready var optionsMenu = load("res://Scenes/Menus/OptionsMenu.tscn")
onready var initialCutscene = load("res://Scenes/Initial.tscn")

onready var music = $Music

func _ready():
	Global.load_game()
	
func pause_music():
	music.playing = false
	
func play_music():
	music.playing = true
	


func switch_scenes(currentScene, newScene):
	currentScene.queue_free()
	add_scene_instance(newScene)
	
func add_scene_instance(scene):
	var sceneInstance = scene.instance()
	add_child(sceneInstance)
	
##############
##High level##
##############

func switch_to_main_world(currentScene):
	Global.save_game()
	switch_scenes(currentScene, mainWorld)
	
func switch_to_victory(currentScene):
	switch_scenes(currentScene, victoryScene)
	
func switch_to_main_menu(currentScene):
	Global.save_game()
	switch_scenes(currentScene, mainMenu)
	
func switch_to_defeat(currentScene):
	switch_scenes(currentScene, defeatScene)
	
func switch_to_options_menu(currentScene):
	switch_scenes(currentScene, optionsMenu)
	
func switch_to_initial(currentScene):
	switch_scenes(currentScene, initialCutscene)
	
