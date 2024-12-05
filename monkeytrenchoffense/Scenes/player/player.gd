class_name Player
extends CharacterBody2D

var movement_speed:float = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	_handle_movement_inputs()
	move_and_slide()


func _handle_movement_inputs() -> void:
	var input_direction = Vector2(
			Input.get_action_strength("move right") - Input.get_action_strength("move left"),
			Input.get_action_strength("move down") - Input.get_action_strength("move up")
	).normalized()
	#do i use limit_length(1.0) or normalized() here?
	
	velocity = input_direction * movement_speed
