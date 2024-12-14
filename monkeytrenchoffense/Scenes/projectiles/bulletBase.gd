class_name BulletBase
extends Node2D

var direction: Vector2 = Vector2.ZERO

var speed : float = 400.0
var damage : int = 1
var pierce : int = 1
var time : float = 1.0
var seeking : bool = false

var slow : float = 1.0
var slow_duration : float = 0.0

var target : Player = null
var travelling : bool = true


func _process(delta):
	if seeking and target != null:
		direction = global_position.direction_to(target.global_position)
	if travelling:
		position += direction * speed * delta
		rotation = direction.angle()

#used for setting properties
func configure(s:float = 400.0, sz:float = 1.0, d:int = 1, p:int = 1, 
		t:float = 1.0, sk:bool = false, sl:float = 1.0, sld:float = 0.0) -> void:
	speed = s
	scale = Vector2(sz/10,sz/10)
	damage = d
	pierce = p
	time = t
	seeking = sk
	slow = sl
	slow_duration = sld
	$DisappearTimer.wait_time = time

func _on_area_2d_area_entered(area):
	pierce -= 1
	var obj = area.get_parent()
	obj.apply_damage(damage, obj.DamageType.SHARP)
	obj.set_effects(slow, slow_duration)
	if pierce == 0:
		queue_free()

func _on_disappear_timer_timeout():
	queue_free()
