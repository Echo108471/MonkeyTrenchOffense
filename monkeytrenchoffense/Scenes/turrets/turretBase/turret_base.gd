class_name Turret
extends Node2D

var target:Player = null #probably lock to the player?

var attack_speed := 1.0:
	set(value):
		attack_speed = value
		$AttackCooldown.wait_time = 1.0/value
var attack_range := 1.0:
	set(value):
		attack_range = value
		$AttackRange/CollisionShape2D.shape.radius = value
var damage := 1.0
var swivel : float = 5
 #the agility with which the turret rotates


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not target == null:
		rotate(get_angle_to(target.position) * delta * swivel)
	

func attack() -> void:
	pass