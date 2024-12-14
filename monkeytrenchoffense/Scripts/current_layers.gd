extends Label

@export var player: Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = %Player
	player.layersChanged.connect(updateLayers)
	updateLayers()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func updateLayers():
	text = "Current Layers Left: " + str(player.curr_layers)
