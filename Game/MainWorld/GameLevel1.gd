extends Node2D

onready var player = $Player

func _ready():
	pass

func _on_Crown_body_entered(body):
	if body == player: get_parent().switch_to_victory(self)
