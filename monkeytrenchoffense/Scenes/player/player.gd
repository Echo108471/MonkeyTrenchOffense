class_name Player
extends CharacterBody2D

var movement_speed:float = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	_handle_movement_inputs(delta)
	move_and_slide()


func _handle_movement_inputs(delta:float) -> void:
	var input_direction = Vector2(
			Input.get_action_strength("move right") - Input.get_action_strength("move left"),
			Input.get_action_strength("move down") - Input.get_action_strength("move up")
	).normalized()
	#do i use limit_length(1.0) or normalized() here?
	
	#velocity = input_direction * movement_speed
	
	if input_direction.length() == 0:
		velocity *= 0.8
	else:
		velocity += input_direction * movement_speed * delta * 5
	velocity = velocity.limit_length(movement_speed)
