extends Node2D

onready var dialogueTimer = $DialogueTimer
onready var dialogueAudio = $Dialogue

var random = RandomNumberGenerator.new()


onready var pathToDialogueLines = ["res://Player/Sound/Dialogue/Be with her.wav",
"res://Player/Sound/Dialogue/go play with sis.wav",
"res://Player/Sound/Dialogue/I wish I could go home.wav",
"res://Player/Sound/Dialogue/Mom's food.wav",
"res://Player/Sound/Dialogue/repay you.wav",
"res://Player/Sound/Dialogue/Stars, can I even do this.wav",
"res://Player/Sound/Dialogue/the heat of the bonfire is nice too.wav",
"res://Player/Sound/Dialogue/This sucks, I'm sick of jumping.wav",
"res://Player/Sound/Dialogue/Why am I even doing this.wav",
"res://Player/Sound/Dialogue/Why do I even have to find this crown.wav",
"res://Player/Sound/Dialogue/Why me.wav"]


####################
##Engine Functions##
####################

# Called when the node enters the scene tree for the first time.
func _ready(): dialogueTimer.start()
	
func pause_dialogue():
	dialogueAudio.set_stream_paused(true)
	dialogueTimer.set_paused(true)

func restart_dialogue(): 
	dialogueAudio.set_stream_paused(false)
	dialogueTimer.set_paused(false)
	
	
func _on_DialogueTimer_timeout():
	if pathToDialogueLines.size():
		random.randomize()
		var lineNbr = int(random.randf_range(0, pathToDialogueLines.size() - 1))
		dialogueAudio.set_stream(load(pathToDialogueLines[lineNbr]))
		dialogueAudio.play()
		pathToDialogueLines.remove(lineNbr)
	
	
	
func _on_Dialogue_finished(): dialogueTimer.start()

