extends MarginContainer

onready var timer = $Timer
onready var animation = $AnimationPlayer
onready var audio = $"Evil Laugh"


# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout(): 
	animation.play("Fade In")
	audio.play()


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Fade Out": timer.start()


func _on_Evil_Laugh_finished():
	animation.play("Fade Out")
