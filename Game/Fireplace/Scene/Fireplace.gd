extends Area2D

onready var interactionKeySprite = $InteractionKeySprite



# Called when the node enters the scene tree for the first time.
func _ready():
	interactionKeySprite.hide() 



func _on_Fireplace_body_entered(body):
	if get_parent().is_player(body): interactionKeySprite.show()
		


func _on_Fireplace_body_exited(body):
	if get_parent().is_player(body): interactionKeySprite.hide()
