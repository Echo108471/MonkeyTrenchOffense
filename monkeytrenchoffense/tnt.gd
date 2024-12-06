extends Area2D

var explosion_timer = 3.0  
var timer_active = false
var explosion_radius = 200.0  

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
	
	var tnt_position = global_position
	var player_position = player.global_position
	
	var distance = tnt_position.distance_to(player_position)
	
	if distance <= explosion_radius:
		player.get_damage(1)
	
	queue_free()
