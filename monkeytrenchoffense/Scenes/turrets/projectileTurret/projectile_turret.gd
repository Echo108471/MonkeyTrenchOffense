class_name ProjectileTurret
extends Turret


func _ready() -> void:
	super()
	sound = $DartFireSound
	projectile_template = preload("res://Scenes/projectiles/bulletBase.tscn")
	print(self, bulletDamage, bulletCount)

func _process(delta: float) -> void:
	super(delta)

func _draw() -> void:
	#if a target is within range, display that range
	if target != null:
		draw_circle(Vector2.ZERO, attack_range, Color.DIM_GRAY, false, 2.0)


func _fire_projectile() -> void:
	super()
	#print(bulletDamage, bulletCount)
