extends Area2D

@export var player_location:Node2D

var player: Player


func _ready() -> void:
	player = %Player

func _on_body_entered(_body:Node2D) -> void:
	# Position the player for the second level
	if _body == player:
		player.position = player_location.position
		# Remove this trigger node.
		queue_free()
