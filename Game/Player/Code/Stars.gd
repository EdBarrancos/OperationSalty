extends Node2D


var fireplace
var crownPosition

#Not optimal, but out of time. If I wanted to make more then one line
# of dialogue for each option I would be F*****
onready var leftDialogueZeroOrThree
onready var leftDialogueTwo
onready var leftDialogueOne

onready var rightDialogueOneOrTwo
onready var rightDialogueZero
onready var rightDialogueThree

onready var middleDialogueZero = "res://Player/Sound/Star Dialogue/MiddleDialogue/middleZero.wav"
onready var middleDialogueOne = "res://Player/Sound/Star Dialogue/MiddleDialogue/middleOne.wav"
onready var middleDialogueTwo = "res://Player/Sound/Star Dialogue/MiddleDialogue/middleTwo.wav"
onready var middleDialogueThree = "res://Player/Sound/Star Dialogue/MiddleDialogue/middleThree.wav"


onready var audio = $StarDialogue


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func start_interaction(fireplaceLocation):
	crownPosition = get_parent().get_crown_position()
	fireplace = fireplaceLocation
	get_parent().play_starSkyFadeIn_animation()

func dialogue_start():
	if fireplace == 0: #Middle
		match crownPosition:
			0: audio.set_stream(load(middleDialogueZero))
			1: audio.set_stream(load(middleDialogueOne))
			2: audio.set_stream(load(middleDialogueTwo))
			3: audio.set_stream(load(middleDialogueThree))
	elif fireplace == 1: #Right
		match crownPosition:
			0: audio.set_stream(load(rightDialogueZero))
			1: audio.set_stream(load(rightDialogueOneOrTwo))
			2: audio.set_stream(load(rightDialogueOneOrTwo))
			3: audio.set_stream(load(rightDialogueThree))
	elif fireplace == 2: #Left
		match crownPosition:
			0: audio.set_stream(load(leftDialogueZeroOrThree))
			1: audio.set_stream(load(leftDialogueOne))
			2: audio.set_stream(load(leftDialogueTwo))
			3: audio.set_stream(load(leftDialogueZeroOrThree))
		
	audio.play()


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "StarSkyFadeIn": dialogue_start()
	elif anim_name == "StarSkyFadeOut": get_parent().star_interaction_finished()


func _on_StarDialogue_finished():
	get_parent().play_starSkyFadeOut_animation()

