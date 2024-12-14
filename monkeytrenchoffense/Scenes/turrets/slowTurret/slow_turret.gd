class_name SlowTurret
extends Turret


func _ready() -> void:
	super()
	sound = $IceDartSound
	projectile_template = preload("res://Scenes/projectiles/icicleBullet.tscn")


func _process(delta: float) -> void:
	super(delta)
