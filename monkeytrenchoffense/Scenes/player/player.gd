class_name Player
extends CharacterBody2D

@onready var animation = $AnimationPlayer
@export var movement_speed:float = 400
@export var hitpoints:int = 1
@export var drag_factor:float = 4 # how much velocity decreases without input
# (seconds) how long it takes to recover from a dash
@export var dash_duration:float = 0.3
@export var dash_recovery:float = 3.0
@export var lead_hit_anim_duration = 0.3
@export var death_anim_duration = 0.75


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



var dash_multi:float =  2.5 # how much faster the character dashes
var time_since_dash:float = 10

var acceleration_speed:float = movement_speed * 6
var acceleration:Vector2 = Vector2.ZERO

var slow_multi : float = 1.0
var slow_duration : float = 0.0

# this is the state the player will go to when their current power ends
var current_power:Power = Power.RED
var sub_power:Power = Power.DEAD
var lead_hit_duration:float = 0.0
var death_flag = false

#var _max_speed: float = 0
#var _vel_tween: Tween 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#$AnimationPlayer.play("RESET")
	#_vel_tween = create_tween()
	apply_power_up(Power.RED)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	#print(time_since_dash)
	_handle_movement_inputs(delta)
	
	$Sprite2Dplayer.flip_h = velocity.x >= 0 and current_power == Power.BEAST
	
	if Input.is_action_just_pressed("power"):
		apply_power_up(current_power + 1 if current_power != Power.BLACK_HOLE else Power.RED)
	
	if slow_duration > 0:
		velocity *= slow_multi
		slow_duration -= delta
	
	move_and_slide()
	
	if lead_hit_duration > 0 and current_power != Power.LEAD:
		lead_hit_duration = 0.0
	
	if lead_hit_duration > 0:
		lead_hit_duration += delta
		
	if lead_hit_duration > lead_hit_anim_duration:
		$Sprite2Dplayer.texture = preload("res://Assets/balloon/lead.png")
		$AnimationPlayer.play("RESET")
		animation.queue("floating")
		lead_hit_duration = 0.0
	
	
	

func apply_damage(damage:int, damage_type:DamageType = DamageType.SHARP) -> void:
	
	hitpoints -= damage
	if current_power == Power.LEAD:
		$LeadBalloonSound.play()
	elif hitpoints >= 0 and current_power != Power.RED:
		$BalloonHitSound.play()
		
	if damage_type == DamageType.EXPLOSIVE and current_power == Power.LEAD:
		hitpoints = 0
	print(hitpoints)
	if current_power == Power.LEAD and damage_type == DamageType.SHARP && lead_hit_duration == 0:
			$AnimationPlayer.play("lead_hit")
			$LeadBalloonSound.play()
			lead_hit_duration = 0.001
		
	if hitpoints <= 0 and death_flag == false:
		apply_power_up(sub_power)
		death_flag = true
		
		

func game_over() -> void:
	#put game over behavior here
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
	# check for dash
	if Input.is_action_just_pressed("dash") and \
			time_since_dash > (dash_recovery + dash_duration):
		time_since_dash = 0
		
		
	
	if time_since_dash < dash_duration:
		#var cur_dash_speed = velocity.length() + movement_speed * dash_multi * (time_since_dash / (dash_duration))
		#cur_dash_speed = clampf(cur_dash_speed, velocity.length(), movement_speed * dash_multi)
		#Tween.
		velocity = velocity.normalized() * Tween.interpolate_value(movement_speed, 
				movement_speed * dash_multi, 
				time_since_dash, dash_duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$BalloonDashSound.play()
		return

	#
	var velocity_multi = 1
	if time_since_dash < dash_duration + dash_recovery:
		velocity_multi = clampf((time_since_dash) / dash_recovery, 0.80, 1)
		
	# setup drag
	acceleration.x = -velocity.x * drag_factor
	acceleration.y = -velocity.y * drag_factor
	
	# if there are inputs, they will override the drag above
	var input_dir = Vector2(Input.get_vector("move left", "move right", "move up", "move down"))
	
	if death_flag:
		input_dir = Vector2(0, 0)
	
	# make it easier to turn around by overriding drag when changing direction
	if input_dir.x:
		acceleration.x = input_dir.x * acceleration_speed
	if input_dir.y:
		acceleration.y = input_dir.y * acceleration_speed
	
	var max_speed = movement_speed * velocity_multi
	if (time_since_dash > dash_duration):
		velocity.x = clampf(velocity.x + acceleration.x * delta, -max_speed, max_speed)
		velocity.y = clampf(velocity.y + acceleration.y * delta, -max_speed, max_speed)
		velocity.limit_length(max_speed)
			

func apply_power_up(power:Power) -> void:
	current_power = power
	# restore basic properties
	# some will be overwritten in match below
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
	animation.queue("floating")
	
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
			#$Sprite2Dplayer.set_modulate(Color(10, 10, 10, 1))
		
		Power.BEAST:
			hitpoints = 3
			sub_power = Power.GREEN
			movement_speed *= 1.4
			dash_recovery = 0.05
			dash_duration *= 1.25
			#$Sprite2Dplayer.texture = preload("res://Assets/balloon/beast_sprite.png")
			#$Sprite2Dplayer.texture = ImageTexture.create_from_image(beast_sprite.png)
			$AnimationPlayer.play("beast_idle")
			
		Power.BLACK_HOLE:
			#print('blackhole')
			hitpoints = 3
			sub_power = Power.GREEN
			$AnimationPlayer.play("black_hole_idle")
			
	acceleration_speed = movement_speed * 6
