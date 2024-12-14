class_name SlowTurret
extends Turret

func _ready() -> void:
	super()
	sound = $IceDartSound
	projectile_template = preload("res://Scenes/projectiles/icicleBullet.tscn")

func _process(delta: float) -> void:
	super(delta)

func _draw() -> void:
	#if a target is within range, display that range
	if target != null:
		draw_circle(Vector2.ZERO, attack_range, Color.DIM_GRAY, false, 2.0)
