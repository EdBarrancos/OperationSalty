extends Node2D


var fireplace
var crownPosition


onready var leftDialogueZeroOrThree = "You have come too far, go East. Go."
onready var leftDialogueTwo = "Chosen One, North is the way"
onready var leftDialogueOne = "Just a little bit more. South, you will find your fate south"

onready var rightDialogueOneOrTwo = "You have come too far, go West. Go."
onready var rightDialogueZero = "Just a little bit more. South, you will find your fate south"
onready var rightDialogueThree = "Chosen One, North is the way"

onready var middleDialogueZero = "Blessed, You will find your fate near the Heart Shapped Island"
onready var middleDialogueOne = "Travel to the Stone Warrior. Fullfill your destiny"
onready var middleDialogueTwo = "Be attempt for the Giant Sword in the Sky, chosen one"
onready var middleDialogueThree = "Near the Flying house made of earth you will find what you need"


onready var audio = $StarDialogue
onready var colorRect = $ColorRect
onready var label = $Label
onready var light = $Light2D
onready var timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	colorRect.hide()
	label.hide()
	light.hide()


func start_interaction(fireplaceLocation):
	audio.play()
	crownPosition = get_parent().get_crown_position()
	fireplace = fireplaceLocation
	get_parent().play_starSkyFadeIn_animation()

func dialogue_start():
	colorRect.show()
	label.show()
	light.show()
	if fireplace == 0: #Middle
		match crownPosition:
			0: label.set_text(middleDialogueZero)
			1: label.set_text(middleDialogueOne)
			2: label.set_text(middleDialogueTwo)
			3: label.set_text(middleDialogueThree)
	elif fireplace == 1: #Right
		match crownPosition:
			0: label.set_text(rightDialogueZero)
			1: label.set_text(rightDialogueOneOrTwo)
			2: label.set_text(rightDialogueOneOrTwo)
			3: label.set_text(rightDialogueThree)
	elif fireplace == 2: #Left
		match crownPosition:
			0: label.set_text(leftDialogueZeroOrThree)
			1: label.set_text(leftDialogueOne)
			2: label.set_text(leftDialogueTwo)
			3: label.set_text(leftDialogueZeroOrThree)
	
	timer.start()


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "StarSkyFadeIn": dialogue_start()
	elif anim_name == "StarSkyFadeOut":
		audio.playing = false
		get_parent().star_interaction_finished()


func _on_Timer_timeout():
	colorRect.hide()
	label.hide()
	light.hide()
	get_parent().play_starSkyFadeOut_animation()
