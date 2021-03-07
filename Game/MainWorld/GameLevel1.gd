extends Node2D

onready var player = $Player
onready var crownPositions = $CrownPositions
onready var crown = $Crown

var random = RandomNumberGenerator.new()
export var nbrOfCrownPositions = 4

func _ready():
	random.randomize()
	var positionValue = int(random.randf_range(0, nbrOfCrownPositions - 1))
	var positionC = crownPositions.get_quadrant_position(positionValue)
	print(positionValue)
	crown.set_global_position(positionC)
	crown.start_animation()
	

func _on_Crown_body_entered(body):
	if body == player: get_parent().switch_to_victory(self)


func _on_Player_defeat(): get_parent().switch_to_defeat(self)

func is_player(object): return object == player
