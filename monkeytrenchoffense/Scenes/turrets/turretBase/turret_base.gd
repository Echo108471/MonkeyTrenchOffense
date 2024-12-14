class_name Turret
extends Node2D

var target:Player = null #probably lock to the player?

var bulletCount : int = 1

var bulletSpeed : float = 400.0
var bulletSize : float = 1.0
var bulletDamage : int = 0
var bulletPierce : int = 1
var bulletTime : float = 1
var bulletSeeking : bool = false
var bulletSlow : float = 1.0
var bulletSlowDuration : float = 0.0
var max_cone_angle : float = 90


var sound:AudioStreamPlayer2D
var projectile_template:PackedScene
var _shoot_direction:Vector2

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
	


func _on_attack_range_area_entered_proj(area: Area2D) -> void:
	target = area.get_parent()
	
	#this handles the attack timing, and prevents indefinite stalling by going in and out of range
	if $AttackCooldown.paused:
		$AttackCooldown.paused = false
	else:
		$AttackCooldown.start()
	
	queue_redraw()


func _on_attack_range_area_exited_proj(area: Area2D) -> void:
	if area.get_parent() == %Player:
		target = null
		$AttackCooldown.paused = true
	
	queue_redraw()


func attack():
	if target == null:
		return
	
	var true_direction: Vector2 = $LaunchPoint.global_position.direction_to(target.global_position)
	#radian representation of working cone angle
	var cone_angle: float = min((bulletCount-1) * deg_to_rad(20.0), deg_to_rad(max_cone_angle))
	_shoot_direction = true_direction.rotated(-1 * cone_angle/2)
	
	_fire_projectile()

	$AnimationPlayer.play("fire")


func _fire_projectile() -> void:
	var cone_angle: float = min((bulletCount-1) * deg_to_rad(20.0), deg_to_rad(max_cone_angle))
	for i in bulletCount:
		var projectile = projectile_template.instantiate()
		#projectile.direction = $LaunchPoint.global_position.direction_to(target.global_position)
		projectile.direction = _shoot_direction
		_shoot_direction = _shoot_direction.rotated( ( cone_angle / max((bulletCount-1), 1) ) )
		
		projectile.global_position = $LaunchPoint.global_position
	
		projectile.configure(bulletSpeed, bulletSize, bulletDamage, bulletPierce, bulletTime, bulletSeeking, bulletSlow, bulletSlowDuration)
	
		$"..".add_child(projectile)
		sound.play()
