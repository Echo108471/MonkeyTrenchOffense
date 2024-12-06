class_name ProjectileTurret
extends Turret

var bulletSpeed : float = 400.0
var bulletSize : float = 1.0
var bulletDamage : int = 1
var bulletPierce : int = 1
var bulletTime : float = 1
var bulletSeeking : bool = false


func _ready() -> void:
	swivel = 7 #dart towers should be more agile than average
	attack_range = 300.0

func _process(delta: float) -> void:
	super(delta)

func _draw() -> void:
	#if a target is within range, display that range
	if target != null:
		draw_circle(Vector2.ZERO, attack_range, Color.DIM_GRAY, false, 2.0)

func attack():
	#$LaunchPoint.add_child(preload("res://Scenes/turrets/projectileTurret/bullet/bulletBase.tscn").instantiate())
	var projectile := preload("res://Scenes/projectiles/bulletBase.tscn").instantiate()
	projectile.direction = $LaunchPoint.global_position.direction_to(target.global_position)
	projectile.global_position = $LaunchPoint.global_position
	
	projectile.configure(bulletSpeed, bulletDamage, bulletPierce, bulletTime, bulletSeeking)
	
	$"..".add_child(projectile)


func _on_attack_range_body_entered(_body: Node2D) -> void:
	#print("enter")
	target = %Player
	
	#this handles the attack timing, and prevents indefinite stalling by going in and out of range
	if $AttackCooldown.paused:
		$AttackCooldown.paused = false
	else:
		$AttackCooldown.start()
	
	queue_redraw()


func _on_attack_range_body_exited(_body: Node2D) -> void:
	#print("exit")
	target = null
	$AttackCooldown.paused = true
	
	queue_redraw()
