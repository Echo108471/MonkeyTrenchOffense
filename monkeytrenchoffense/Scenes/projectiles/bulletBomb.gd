extends Node2D


var direction: Vector2 = Vector2.ZERO

var fuse : float = 0.5

var speed : float = 400.0
var damage : int = 1
var pierce : int = 1
var time : float = 1.0
var seeking : bool = false

var slow : float = 1.0
var slow_duration : float = 0.0

var target : Player = null

var travelling : bool = true

func _ready() -> void:
	$explosion.visible = false
	$bombBody.visible = true

func _process(delta):
	if seeking and target != null:
		direction = global_position.direction_to(target.global_position)
	if travelling:
		position += direction * speed * delta
		rotation = direction.angle()

#used for setting properties
func configure(s:float = 400.0, sz:float = 1.0, d:int = 1, p:int = 1, t:float = 1.0, sk:bool = false, sl:float = 1.0, sld:float = 0.0) -> void:
	speed = s
	scale = Vector2(sz,sz)
	damage = d
	pierce = p
	time = t
	seeking = sk
	slow = sl
	slow_duration = sld
	
	$DisappearTimer.wait_time = 1
	
	$Area2D/hitBox.disabled = true

func _on_area_2d_area_entered(area):
	pierce -= 1
	var obj = area.get_parent()
	obj.get_damage(damage)
	obj.get_effects(slow, slow_duration)
	if pierce <= 0:
		queue_free()

func _on_travel_timer_timeout() -> void:
	travelling = false
	$FuseTimer.start()
	$AnimationPlayer.play("fuse")

func _on_fuse_timer_timeout() -> void:
	$explosion.visible = true
	$bombBody.visible = false
	$AnimationPlayer.play("explode")
	$DisappearTimer.start()

func _on_disappear_timer_timeout():
	queue_free()