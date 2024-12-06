extends Node2D


var direction: Vector2 = Vector2.ZERO

var speed : float = 400.0
var damage : int = 1
var pierce : int = 1
var time : float = 1.0
var seeking : bool = false

var target : Player = null



func _process(delta):
	if seeking and target != null:
		direction = global_position.direction_to(target.global_position)
	position += direction * speed * delta
	rotation = direction.angle()

#used for setting properties
func configure(s:float = 400.0, d:int = 1, p:int = 1, t:float = 1.0, sk:bool = false) -> void:
	speed = s
	damage = d
	pierce = p
	time = t
	seeking = sk

func _on_area_2d_area_entered(area):
	var obj = area.get_parent()
	pierce -= 1
	obj.get_damage(damage)
	if pierce == 0:
		queue_free()

func _on_disappear_timer_timeout():
	queue_free()
