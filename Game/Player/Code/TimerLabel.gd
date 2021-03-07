extends Label

onready var timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()
	get_font("font").font_data.antialiased = false
	get_font("font").use_filter = true
	get_font("font").use_filter = false
	
func update_label():
	var minutes
	var seconds
	seconds = timer.get_time_left()
	minutes = int(seconds)/60
	seconds -= minutes * 60
	set_text(str(minutes) + ":" + str(int(seconds)))
	
	
