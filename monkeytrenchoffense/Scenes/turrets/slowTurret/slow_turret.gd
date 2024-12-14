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
	
	sound = $IceDartSound
	projectile_template = preload("res://Scenes/projectiles/icicleBullet.tscn")

func _process(delta: float) -> void:
	super(delta)

func _draw() -> void:
	#if a target is within range, display that range
	if target != null:
		draw_circle(Vector2.ZERO, attack_range, Color.DIM_GRAY, false, 2.0)
