extends BulletBase


var fuse : float = 0.5

func _ready() -> void:
	$explosion.visible = false
	$bombBody.visible = true
	$Area2D/hitBox.disabled = true
	$DisappearTimer
	
func configure(s:float = 400.0, sz:float = 1.0, d:int = 1, p:int = 1, t:float = 1.0, sk:bool = false, sl:float = 1.0, sld:float = 0.0) -> void:
	super(s, sz, d, p, t, sk, sl, sld)
	scale = Vector2(sz, sz)
	$DisappearTimer.wait_time = 1
	
func _on_area_2d_area_entered(area):
	pierce -= 1
	var obj = area.get_parent()
	obj.apply_damage(damage)
	obj.set_effects(slow, slow_duration)
	if pierce <= 0:
		damage = 0

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
