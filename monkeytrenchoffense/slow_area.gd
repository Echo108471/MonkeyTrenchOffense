extends Area2D

@export var slow_factor = 0.5 
@export var radius = 150.0

@onready var player : Player = %Player


# Called when a body enters the area
func _on_body_entered(body):
	print("Player entered slow-down zone")
	if body == player:
		slow_player(body)

# Called when a body exits the area
func _on_body_exited(body):
	print("Player exited slow-down zone")
	if body == player:
		restore_player_speed(body)

# Function to slow down the player
func slow_player(player):
	SignalManager.emit_signal("collected", "slow")
	player.movement_speed *= slow_factor

# Function to restore the player's speed
func restore_player_speed(player):
	player.movement_speed /= slow_factor
