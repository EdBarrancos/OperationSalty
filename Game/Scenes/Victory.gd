extends Node2D

onready var narrator = $Narrator
onready var crowd = $crowd

# Called when the node enters the scene tree for the first time.
func _ready():
	narrator.play()
	crowd.play()
	get_parent().pause_music()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Narrator_finished():
	crowd.playing = false
	get_parent().play_music()
	Global.set_hasSeen_intro(false)
	get_parent().switch_to_main_menu(self)
