class_name Turret
extends Node2D

var target:Player = null #probably lock to the player?

@export var bulletCount : int = 1

@export var bulletSpeed : float = 400.0
@export var bulletSize : float = 1.0
@export var bulletDamage : int = 0
@export var bulletPierce : int = 1
@export var bulletTime : float = 1
@export var bulletSeeking : bool = false
@export var bulletSlow : float = 0
@export var bulletSlowDuration : float = 0.0
@export var max_cone_angle : float = 90

@export var attack_speed := 1.0
@export var attack_range := 300.0
@export var damage := 1.0
@export var swivel : float = 5

var sound:AudioStreamPlayer2D
var projectile_template:PackedScene
var _shoot_direction:Vector2

 #the agility with which the turret rotates


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AttackRange/CollisionShape2D.shape.radius = attack_range
	$AttackCooldown.wait_time = 1.0/attack_speed

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

		projectile.direction = _shoot_direction
		_shoot_direction = _shoot_direction.rotated( ( cone_angle / max((bulletCount-1), 1) ) )
		
		projectile.global_position = $LaunchPoint.global_position
	
		projectile.configure(bulletSpeed, bulletSize, bulletDamage, bulletPierce, 
				bulletTime, bulletSeeking, bulletSlow, bulletSlowDuration)
	
		get_tree().current_scene.add_child(projectile)
		sound.play()
