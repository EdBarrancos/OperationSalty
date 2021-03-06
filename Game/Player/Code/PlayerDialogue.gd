extends Node2D

onready var dialogueTimer = $DialogueTimer
onready var dialogueAudio = $Dialogue

var random = RandomNumberGenerator.new()

var dialogueLines
onready var pathToDialogueLines = "res://Player/Sound/Dialogue"

####################
##Engine Functions##
####################

# Called when the node enters the scene tree for the first time.
func _ready():
	dialogueLines = list_files_in_directory(pathToDialogueLines)
	dialogueTimer.start()
	
	
func _on_DialogueTimer_timeout():
	if dialogueLines.size():
		random.randomize()
		var lineNbr = int(random.randf_range(0, dialogueLines.size() - 1))
		#print(dialogueLines)
		dialogueAudio.set_stream(load(pathToDialogueLines + "/" + dialogueLines[lineNbr]))
		dialogueAudio.play()
		dialogueLines.remove(lineNbr)
	
	
	
func _on_Dialogue_finished(): dialogueTimer.start()

#################
##File Handling##
#################

func list_files_in_directory(path):
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			if not file.ends_with(".import"):
				files.append(file)

	dir.list_dir_end()

	return files

