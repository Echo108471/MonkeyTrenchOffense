extends Area2D

@export var slow_factor = 0.5  # The factor by which the player speed is reduced (0.5 means 50% slower)
@export var radius = 150.0  # The radius of the slow-down zone

@onready var player : Player = get_node("../Player")  # Assuming the player node is a sibling or child

# Called when a body enters the area
func _on_body_entered(body):
	print("Player entered slow-down zone")
	if body == player:  # Check if the body is the player
		slow_player(body)

# Called when a body exits the area
func _on_body_exited(body):
	print("Player exited slow-down zone")
	if body == player:  # Check if the body is the player
		restore_player_speed(body)

# Function to slow down the player
func slow_player(player):
	player.movement_speed *= slow_factor  # Assuming player has a speed variable

# Function to restore the player's speed
func restore_player_speed(player):
	player.movement_speed /= slow_factor  # Assuming player has a speed variable
