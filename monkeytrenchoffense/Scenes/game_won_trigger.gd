class_name GameWonTrigger
extends Area2D

@export var player_location:Node2D

var player: Player


func _ready() -> void:
	player = %Player

func _on_body_entered(_body:Node2D) -> void:
	
	if _body == player:
		get_tree().change_scene_to_file.bind("res://Scenes/game_won.tscn").call_deferred()
