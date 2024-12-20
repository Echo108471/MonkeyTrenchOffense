extends Area2D


var speed_boost_duration: float = 5.0  # Duration of the speed boost in seconds
var speed_multiplier: float = 1.5
var boost_timer: Timer

@onready var player : Player = %Player

func _ready():
	# Create and configure the boost timer
	boost_timer = Timer.new()
	boost_timer.wait_time = speed_boost_duration
	boost_timer.one_shot = true
	boost_timer.connect("timeout",Callable(self, "_on_boost_end"))
	add_child(boost_timer)

func _on_body_entered(body):
	if body == player:  # Ensure that only the player can pick up the coin
		give_speed_boost()
		$PlayerCollectCoinSound.play()

# Function to give the player a speed boost
func give_speed_boost():
	print("Timer Started!")
	player.movement_speed *= speed_multiplier  
	boost_timer.start()
	self.visible = false 

func _on_boost_end():
	player.movement_speed /= speed_multiplier  # Reset the player's speed to normal
	queue_free()
