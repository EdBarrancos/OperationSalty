extends Node2D

onready var victoryScene = load("res://Scenes/Victory.tscn")
onready var mainWorld = load("res://MainWorld/GameLevel1.tscn")
onready var mainMenu = load("res://Scenes/MainMenu.tscn")

func _ready():
	pass


func switch_scenes(currentScene, newScene):
	currentScene.queue_free()
	add_scene_instance(newScene)
	
func add_scene_instance(scene):
	var sceneInstance = scene.instance()
	add_child(sceneInstance)
	
func switch_to_main_world(currentScene):
	switch_scenes(currentScene, mainWorld)
	
func switch_to_victory(currentScene):
	switch_scenes(currentScene, victoryScene)
	
func switch_to_mainMenu(currentScene):
	switch_scenes(currentScene, mainMenu)
