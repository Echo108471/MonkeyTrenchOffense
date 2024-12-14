class_name BombTurret
extends Turret


func _ready() -> void:
	swivel = 3 #bomb turrent slow
	attack_range = 600.0
	attack_speed = 0.5
	
	bulletCount = 1
	
	bulletSize = 2.5
	bulletDamage = 10
	
	bulletTime  = 4
	bulletSeeking = false
	
	projectile_template = preload("res://Scenes/projectiles/bulletBomb.tscn")
	sound = $FallingBombSound
	

func _process(delta: float) -> void:
	super(delta)

func _draw() -> void:
	#if a target is within range, display that range
	if target != null:
		draw_circle(Vector2.ZERO, attack_range, Color.DIM_GRAY, false, 2.0)

func _fire_projectile() -> void:
	var cone_angle: float = min((bulletCount-1) * deg_to_rad(20.0), deg_to_rad(max_cone_angle))
	for i in bulletCount:
		var projectile = projectile_template.instantiate()
		projectile.launch_to(target.global_position, 3.3)
		projectile.direction = _shoot_direction
		_shoot_direction = _shoot_direction.rotated( ( cone_angle / max((bulletCount-1), 1) ) )
		
		projectile.global_position = $LaunchPoint.global_position
	
		projectile.configure(bulletSpeed, bulletSize, bulletDamage, bulletPierce, bulletTime, bulletSeeking, bulletSlow, bulletSlowDuration)
	
		$"..".add_child(projectile)
		var timer = Timer.new()
		add_child(timer)
		timer.wait_time = 3.3
		timer.one_shot = true
		timer.start()
		await timer.timeout
		$BombExplosionSound.play()
