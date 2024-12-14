extends TextureProgressBar

@export var player: Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = %Player
	player.blackHoleChanged.connect(updateBlackHoleBar)
	updateBlackHoleBar()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func updateBlackHoleBar():
	if player.time_since_absorb < player.absorb_duration:
		value = 100.0 - ((player.time_since_absorb * 100) / player.absorb_duration)
	elif player.time_since_absorb > player.absorb_duration and player.time_since_absorb < player.absorb_recovery + player.absorb_duration:
		value = (((player.time_since_absorb - player.absorb_duration) * 100) / player.absorb_recovery)
	else:
		value = 100
