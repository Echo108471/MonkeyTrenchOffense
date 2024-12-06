extends Area2D

var explosion_timer = 3.0  # Time in seconds before explosion
var timer_active = false
var explosion_radius = 200.0  # Explosion radius in pixels

@onready var player : Player = %Player

# When the player enters the TNT area
func _on_body_entered(body):
	print("Area Entered!")
	if body == player:
		start_timer()

# Start the explosion timer
func start_timer():
	print("TIMER STARTED")
	if not timer_active:
		timer_active = true
		await get_tree().create_timer(explosion_timer).timeout
		explode()

# Handle explosion
func explode():
	print("BOOM! The TNT exploded!")
	
	# Get the position of the TNT (this object) and the player
	var tnt_position = global_position
	var player_position = player.global_position
	
	# Calculate the distance between the TNT and the player
	var distance = tnt_position.distance_to(player_position)
	
	# If the player is within the explosion radius, deal damage
	if distance <= explosion_radius:
		player.get_damage(1)  # Apply damage to the player
	
	queue_free()  # Remove the TNT or the exploding object from the scene
