class_name BombTurret
extends Turret

signal fired(type: String)

var max_cone_angle : float = 90

func _ready() -> void:
	swivel = 3 #bomb turrent slow
	attack_range = 600.0
	
	bulletCount = 1
	
	bulletSize = 5.0
	bulletDamage = 10
	
	bulletTime  = 4
	bulletSeeking = false

func _process(delta: float) -> void:
	super(delta)

func _draw() -> void:
	#if a target is within range, display that range
	if target != null:
		draw_circle(Vector2.ZERO, attack_range, Color.DIM_GRAY, false, 2.0)

func attack():
	if target == null:
		return
	
	var true_direction: Vector2 = $LaunchPoint.global_position.direction_to(target.global_position)
	#radian representation of working cone angle
	var cone_angle: float = min((bulletCount-1) * deg_to_rad(20.0), deg_to_rad(max_cone_angle))
	var shoot_direction: Vector2 = true_direction.rotated(-1 * cone_angle/2)
	
	for i in bulletCount:
		var projectile := preload("res://Scenes/projectiles/bulletBomb.tscn").instantiate()
		#projectile.direction = $LaunchPoint.global_position.direction_to(target.global_position)
		
		projectile.direction = shoot_direction
		shoot_direction = shoot_direction.rotated( ( cone_angle / max((bulletCount-1), 1) ) )
		
		projectile.global_position = $LaunchPoint.global_position
	
		projectile.configure(bulletSpeed, bulletSize, bulletDamage, bulletPierce, bulletTime, bulletSeeking, bulletSlow, bulletSlowDuration)
		
		$"..".add_child(projectile)
	emit_signal("fired", "dart");




func _on_attack_range_area_entered_proj(area: Area2D) -> void:
	if area.get_parent() == %Player:
		target = %Player
	else:
		return
	
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
