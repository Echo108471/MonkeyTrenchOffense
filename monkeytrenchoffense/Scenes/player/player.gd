class_name Player
extends CharacterBody2D

@export var movement_speed:float = 400
@export var hitpoints:int = 1
@export var drag_factor:float = 4 # how much velocity decreases without input

@export var dash_duration:float = 0.3
@export var dash_recovery:float = 3.0

var death_anim_duration = 0.75


enum Power {
	RED,
	BLUE,
	GREEN,
	LEAD,
	BEAST,
	BLACK_HOLE,
	DEAD
}

enum DamageType {
	SHARP,
	EXPLOSIVE
}


var dash_multi:float =  2.5 # how much movement speed is increased during dash
# counter to keep track of dash cooldown and recharge
var time_since_dash:float = dash_duration + dash_recovery 

var acceleration_speed:float = movement_speed * 6
var acceleration:Vector2 = Vector2.ZERO

var slow_multi : float = 1.0 # how much movement speed is decreased by turret fire
var slow_duration : float = 0.0 # how long the slow will last (0 = done)

var current_power:Power = Power.RED
# this is the state the player will go to when their current power ends
var sub_power:Power = Power.DEAD


func _ready() -> void:
	apply_power_up(Power.RED)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	# skip everything if dead
	if current_power == Power.DEAD:
		return
	
	_handle_movement_inputs(delta)
	
	$Sprite2Dplayer.flip_h = velocity.x >= 0 and current_power == Power.BEAST
	
	if Input.is_action_just_pressed("power"):
		apply_power_up(current_power + 1 if current_power != Power.BLACK_HOLE else Power.RED)
	
	if slow_duration > 0:
		velocity *= slow_multi
		slow_duration -= delta
	
	move_and_slide()


func apply_damage(damage:int, damage_type:DamageType = DamageType.SHARP) -> void:
	hitpoints -= damage
	if current_power == Power.LEAD:
		$LeadBalloonSound.play()
	elif hitpoints >= 0 and current_power != Power.RED:
		$BalloonHitSound.play()
		
	if damage_type == DamageType.EXPLOSIVE and current_power == Power.LEAD:
		hitpoints = 0
	print(hitpoints)
	print(sub_power)
	if current_power == Power.LEAD and damage_type == DamageType.SHARP:
			$AnimationPlayer.play("lead_hit")
			$AnimationPlayer.queue("floating")
			$LeadBalloonSound.play()
		
	if hitpoints <= 0:
		apply_power_up(sub_power)

func game_over() -> void:
	# queue all of the death effects and then display end screen
	$AnimationPlayer.play("death")
	$BalloonPoppedSound.play()
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = death_anim_duration
	timer.one_shot = true
	timer.start()
	await timer.timeout
	get_tree().change_scene_to_file("res://Scenes/game_over.tscn")


func set_effects(sl:float, sld:float) -> void:
	slow_multi = sl
	slow_duration = sld
	#print("affected")


func _handle_movement_inputs(delta:float) -> void:
	time_since_dash += delta

	# check for dash input, and that dash recovery is over
	if Input.is_action_just_pressed("dash") and \
			time_since_dash > (dash_recovery + dash_duration):
		time_since_dash = 0
		$BalloonDashSound.play()

	# dash is currently active if time is less than duration
	if time_since_dash < dash_duration:
		velocity = velocity.normalized() * Tween.interpolate_value(movement_speed, 
				movement_speed * dash_multi, 
				time_since_dash, dash_duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		return # skip other steps since dash overrides inputs

	# slow down player after dash
	var dash_recovery_multi = 1
	if time_since_dash < dash_duration + dash_recovery:
		dash_recovery_multi = clampf((time_since_dash) / dash_recovery, 0.6, 1)
		
	# setup drag
	acceleration.x = -velocity.x * drag_factor
	acceleration.y = -velocity.y * drag_factor
	
	# if there are inputs, they will override the drag above
	var input_dir = Vector2(Input.get_vector("move left", "move right", "move up", "move down"))
	
	
	# make it easier to turn around by overriding drag when changing direction
	if input_dir.x:
		acceleration.x = input_dir.x * acceleration_speed
	if input_dir.y:
		acceleration.y = input_dir.y * acceleration_speed
	
	var max_speed = movement_speed * dash_recovery_multi
	if (time_since_dash > dash_duration):
		velocity.x = clampf(velocity.x + acceleration.x * delta, -max_speed, max_speed)
		velocity.y = clampf(velocity.y + acceleration.y * delta, -max_speed, max_speed)
		velocity.limit_length(max_speed)
			

func apply_power_up(power:Power) -> void:
	current_power = power
	# restore basic properties
	# some will be overwritten in match section below
	hitpoints = 1
	drag_factor = 4 
	dash_duration = 0.25
	dash_recovery = 1.0 
	dash_multi =  2.5 
	time_since_dash = 10
	movement_speed = 400
	sub_power = Power.DEAD
	$Sprite2Dplayer.texture = preload("res://Assets/balloon/red.png")
	
	$AnimationPlayer.play("RESET")
	$AnimationPlayer.queue("floating")
	
	# update attributes based on the new power
	match(power):
		Power.DEAD:
			game_over()
		
		Power.BLUE:
			hitpoints = 1
			movement_speed *= 1.1
			sub_power = Power.RED
			$Sprite2Dplayer.texture = preload("res://Assets/balloon/green.png")
		
		Power.GREEN:
			hitpoints = 1
			movement_speed *= 1.2
			sub_power = Power.BLUE
			$Sprite2Dplayer.texture = preload("res://Assets/balloon/blue.png")

		
		Power.LEAD:
			hitpoints = 10
			sub_power = Power.GREEN
			movement_speed *= 0.75
			dash_multi = 1.5
			dash_recovery = 1.5
			$Sprite2Dplayer.texture = preload("res://Assets/balloon/lead.png")
		
		Power.BEAST:
			hitpoints = 3
			sub_power = Power.GREEN
			movement_speed *= 1.4
			dash_recovery = 0.05
			dash_duration *= 1.25
			$AnimationPlayer.play("beast_idle")
			
		Power.BLACK_HOLE:
			hitpoints = 3
			sub_power = Power.GREEN
			$AnimationPlayer.play("black_hole_idle")
			
	acceleration_speed = movement_speed * 6
