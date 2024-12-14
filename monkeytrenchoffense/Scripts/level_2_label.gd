extends Label

const DURATION = 1.0

@onready var trigger1:Area2D = $"../../teleporterArea"
@onready var trigger2:Area2D = $"../../teleporterArea2"


func _on_teleporter_area_2_level_two_start() -> void:
	print("level two label")
	visible = true
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = DURATION
	timer.one_shot = true
	timer.start()
	await timer.timeout
	var tween = create_tween()
	await tween.tween_property(self, "modulate:a", 0, 1).finished
	visible = false


func _on_teleporter_area_level_two_start() -> void:
	print("level two label")
	visible = true
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = DURATION
	timer.one_shot = true
	timer.start()
	await timer.timeout
	var tween = create_tween()
	await tween.tween_property(self, "modulate:a", 0, 1).finished
	visible = false
