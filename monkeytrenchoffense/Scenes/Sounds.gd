class_name Sounds
extends Node2D

func _ready() -> void:
	# Connect to global signals from SignalManager
	SignalManager.connect("fired", on_turret_fired)
	SignalManager.connect("popped", on_pop)
	SignalManager.connect("collected", on_collectable)

func on_turret_fired(type: String) -> void:
	if type == "dart":
		$DartFireSound.play()
	if type == "slow":
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
		
func on_collectable(type: String) -> void:
	if type == "speed":
		$SpeedUpSound.play()
	if type == "tnt_start":
		$BombExplosionStartSound.play()
	if type == "tnt_end":
		$BombExplosionSound.play()
	if type == "slow":
		$SlowSound.play()
		

func on_pop(type: String) -> void:
	if type == "pop":
		$BalloonPopSound.play()
