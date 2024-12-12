class_name SecondLevelTrigger
extends Area2D
#@export var camera_location:Node2D
@export var player_location:Node2D

var player: Player
var camera: Camera2D


func _ready() -> void:
	player = %Player
	camera = $"../Player/Camera2D"

func _on_body_entered(_body:Node2D) -> void:
	# Position the player for the second level
	if _body == player:
		player.position = player_location.position
		# Remove this trigger node.
		queue_free()
