class_name SlowTurret
extends Turret


func _ready() -> void:
	swivel = 5 #slow towers should average agility
	attack_range = 400.0 #slightly larger range
	
	bulletSpeed = 600.0
	bulletSize = 5.0
	bulletDamage = 1
	bulletSlow = 0.8
	bulletSlowDuration = 1.0

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
	var projectile := preload("res://Scenes/projectiles/icicleBullet.tscn").instantiate()
	projectile.direction = $LaunchPoint.global_position.direction_to(target.global_position)
	projectile.global_position = $LaunchPoint.global_position
	
	#print(bulletSlowDuration)
	projectile.configure(bulletSpeed, bulletSize, bulletDamage, bulletPierce, bulletTime, bulletSeeking, bulletSlow, bulletSlowDuration)
	
	$"..".add_child(projectile)
	$IceDartSound.play()
	
	$AnimationPlayer.play("fire")
		#$AnimationPlayer.play("fire")


func _on_attack_range_area_entered_slo(area: Area2D) -> void:
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


func _on_attack_range_area_exited_slo(area: Area2D) -> void:
	if area.get_parent() == %Player:
		target = null
		$AttackCooldown.paused = true
	
	queue_redraw()
