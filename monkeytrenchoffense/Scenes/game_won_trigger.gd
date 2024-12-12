class_name GameWonTrigger
extends Area2D

@export var player_location:Node2D

var player: Player
var camera: Camera2D


func _ready() -> void:
	player = %Player

func _on_body_entered(_body:Node2D) -> void:
	# Position the player for the second level
	if _body == player:
		get_tree().change_scene_to_file("res://Scenes/game_won.tscn")
