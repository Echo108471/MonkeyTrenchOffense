extends Area2D

@onready var player : Player = %Player
@onready var inptUpg:CanvasLayer = $"../InputUpgrade"

func _on_body_entered(body):
	if body == player:  # Ensure that only the player can pick up the coin
		if player.curr_layers == 1:
			player.apply_power_up(player.Power.BLUE)
			queue_free()
		elif player.curr_layers == 2:
			player.apply_power_up(player.Power.GREEN)
			queue_free()
		else:
			inptUpg.visible = true
			get_tree().paused = true
			queue_free()

# Function to give the player a speed boost
func give_speed_boost():
	queue_free()
