class_name ProjectileTurret
extends Turret

var bulletSpeed : float = 400.0
var bulletSize : float = 1.0
var bulletDamage : int = 0
var bulletPierce : int = 1
var bulletTime : float = 1
var bulletSeeking : bool = false
var bulletSlow : float = 1.0
signal fired(type: String)

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
	if target == null:
		return
	
	#$LaunchPoint.add_child(preload("res://Scenes/turrets/projectileTurret/bullet/bulletBase.tscn").instantiate())
	var projectile := preload("res://Scenes/projectiles/bulletBase.tscn").instantiate()
	projectile.direction = $LaunchPoint.global_position.direction_to(target.global_position)
	projectile.global_position = $LaunchPoint.global_position
	
	projectile.configure(bulletSpeed, bulletDamage, bulletPierce, bulletTime, bulletSeeking, bulletSlow)
	
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
