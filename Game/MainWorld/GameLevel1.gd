extends Node2D

onready var player = $Player
onready var crownPositions = $CrownPositions
onready var crown = $Crown

var positionValue

var random = RandomNumberGenerator.new()
export var nbrOfCrownPositions = 4

func _ready():
	random.randomize()
	positionValue = int(random.randf_range(0, nbrOfCrownPositions))
	var positionC = crownPositions.get_quadrant_position(positionValue)
	crown.set_global_position(positionC)
	crown.start_animation()

	
	
func _process(delta):
	if Input.is_action_just_pressed("BACK"): get_parent().switch_to_main_menu(self)

func _on_Crown_body_entered(body):
	if body == player: get_parent().switch_to_victory(self)


func _on_Player_defeat(): get_parent().switch_to_defeat(self)

func is_player(object): return object == player

func get_crown_quadrant():
	return positionValue
