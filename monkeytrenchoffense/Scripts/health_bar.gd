extends TextureProgressBar

@export var player: Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = %Player
	player.healthChanged.connect(updateHealthBar)
	updateHealthBar()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func updateHealthBar():
	value = ((float(player.hitpoints) * 100) / (float(player.max_hitpoints_curr_layer)))
