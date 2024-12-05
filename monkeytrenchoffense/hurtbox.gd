extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	area_entered.connect(_handle_damage)


func _handle_damage() -> void:
	pass
	#will need a way to pass around information about the projectile
