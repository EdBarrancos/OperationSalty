extends Area2D

onready var tween = $Tween
onready var up = true


func _ready():
	pass
	

func set_global_position(value): 
	global_position = value
	return global_position


func start_animation():
	tween.interpolate_property(self, "position",
		position, position + Vector2(0, -20), 1,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

func _on_Tween_tween_all_completed():
	if up:
		tween.interpolate_property(self, "position",
		position , position + Vector2(0, 20), 1,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		up = false
	else:
		tween.interpolate_property(self, "position",
		position, position + Vector2(0, -20), 1,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		up = true
