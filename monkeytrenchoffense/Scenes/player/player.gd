class_name Player
extends CharacterBody2D

@onready var animation = $AnimationPlayer
@export var movement_speed:float = 400
@export var hitpoints:int = 1
@export var drag_factor:float = 4 # how much velocity decreases without input
# (seconds) how long it takes to recover from a dash
@export var dash_duration:float = 0.5
@export var dash_recovery:float = 3.0 

signal popped(type: String)
var dash_speed:float = movement_speed * 2.5 # how fast the character dashes
var time_since_dash:float = 10

var acceleration_speed:float = movement_speed * 6
var acceleration:Vector2 = Vector2.ZERO

var slowed : float = 1.0
var slow_duration : float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	#print(time_since_dash)
	_handle_movement_inputs(delta)
	
	if slow_duration > 0:
		velocity *= slowed
		slow_duration -= delta
	
	move_and_slide()
	
func _process(_delta):
	animation.play("floating")

func get_damage(dam:int) -> void:
	hitpoints -= dam
	#print(hitpoints)
	if hitpoints <= 0:
		#put game over behavior here
		emit_signal("popped", "pop")
		var timer = Timer.new()
		add_child(timer)
		timer.wait_time = 1.0
		timer.one_shot = true
		timer.start()
		await timer.timeout
		get_tree().quit()

func get_effects(sl:float, sld:float) -> void:
	slowed = sl
	slow_duration = sld
	#print("affected")

func _handle_movement_inputs(delta:float) -> void:
	time_since_dash += delta
	# check for dash
	if Input.is_action_just_pressed("dash") and \
			time_since_dash > (dash_recovery + dash_duration):
		time_since_dash = 0
		
	if time_since_dash < dash_duration:
		var cur_dash_speed = velocity.length() + dash_speed * (time_since_dash / (dash_duration))
		cur_dash_speed = clampf(cur_dash_speed, velocity.length(), dash_speed)
		velocity = velocity.normalized() * cur_dash_speed
		return
	
	var velocity_multi = 1
	if time_since_dash < dash_duration + dash_recovery:
		velocity_multi = clampf((time_since_dash - dash_duration) / dash_recovery, 0.4, 1)
		
	# setup drag
	acceleration.x = -velocity.x * drag_factor
	acceleration.y = -velocity.y * drag_factor
	
	# if there are inputs, they will override the drag above
	var input_dir = Vector2(
		Input.get_action_strength("move right") - Input.get_action_strength("move left"),
		Input.get_action_strength("move down") - Input.get_action_strength("move up")
		).limit_length(1.0)
	
	if input_dir.x:
		acceleration.x = input_dir.x * acceleration_speed
	if input_dir.y:
		acceleration.y = input_dir.y * acceleration_speed
	var max_speed = movement_speed * velocity_multi
	velocity.x = clampf(velocity.x + acceleration.x * delta, -max_speed, max_speed)
	velocity.y = clampf(velocity.y + acceleration.y * delta, -max_speed, max_speed)
	#print(max_speed)
	velocity.limit_length(max_speed)
	#velocity *= velocity_multi
