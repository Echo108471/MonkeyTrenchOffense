extends TextureProgressBar

@export var player: Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = %Player
	player.dashChanged.connect(updateDashBar)
	updateDashBar()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func updateDashBar():
	if player.time_since_dash < player.dash_duration:
		value = 100.0 - ((player.time_since_dash * 100) / player.dash_duration)
	elif player.time_since_dash > player.dash_duration and player.time_since_dash < player.dash_recovery + player.dash_duration:
		value = (((player.time_since_dash - player.dash_duration) * 100) / player.dash_recovery)
	else:
		value = 100
