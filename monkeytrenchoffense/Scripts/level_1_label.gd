extends Label

const DURATION = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = DURATION
	timer.one_shot = true
	timer.start()
	await timer.timeout
	var tween = create_tween()
	await tween.tween_property(self, "modulate:a", 0, 1).finished
	
