class_name ProjectileTurret
extends Turret


func _ready() -> void:
	swivel = 7 #dart towers should be more agile than average
	attack_range = 300.0
	
	bulletCount = 9
	
	bulletSize = 2.0
	bulletDamage = 1
	
	bulletTime  = 1
	bulletSeeking = false
	
	sound = $DartFireSound
	projectile_template = preload("res://Scenes/projectiles/bulletBase.tscn")

func _process(delta: float) -> void:
	super(delta)

func _draw() -> void:
	#if a target is within range, display that range
	if target != null:
		draw_circle(Vector2.ZERO, attack_range, Color.DIM_GRAY, false, 2.0)
