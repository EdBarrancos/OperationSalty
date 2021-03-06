extends Node2D


onready var narrator = $Narrator
onready var fire = $Fire

# Called when the node enters the scene tree for the first time.
func _ready():
	narrator.play()
	fire.play()
	get_parent().pause_music()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Narrator_finished():
	fire.playing = false
	get_parent().play_music()
	get_parent().switch_to_main_world(self)
