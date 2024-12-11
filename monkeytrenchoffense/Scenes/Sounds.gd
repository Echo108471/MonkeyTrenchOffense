class_name Sounds
extends Node2D

func _ready() -> void:
	# Connect to global signals from SignalManager
	SignalManager.connect("fired", _on_turret_fired)
	SignalManager.connect("popped", _on_pop)
	SignalManager.connect("collected", _on_collectable)

func _on_turret_fired(type: String) -> void:
	if type == "dart":
		$DartFireSound.play()
	if type == "bomb_start":
		$BombExplosionStartSound.play()
		var timer = Timer.new()
		add_child(timer)
		timer.wait_time = 3.3
		timer.one_shot = true
		timer.start()
		await timer.timeout
		$BombExplosionSound.play()
		
func _on_collectable(type: String) -> void:
	if type == "speed":
		$SpeedUpSound.play()
	if type == "tnt_start":
		$BombExplosionStartSound.play()
	if type == "tnt_end":
		$BombExplosionSound.play()
	if type == "slow":
		$SlowSound.play()
		

func _on_pop(type: String) -> void:
	if type == "pop":
		$BalloonPopSound.play()
