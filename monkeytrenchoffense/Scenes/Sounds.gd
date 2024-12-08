class_name Sounds
extends Node2D

@export var projectile_turret : Node
@export var player : CharacterBody2D

func _ready() -> void:
	projectile_turret.connect("fired", _on_turret_fired)
	player.connect("popped", _on_pop)
	

func _on_turret_fired(type: String) -> void:
	if type == "dart":
		$DartFireSound.play()
		
func _on_pop(type: String) -> void:
	if type == "pop":
		$BalloonPopSound.play()
