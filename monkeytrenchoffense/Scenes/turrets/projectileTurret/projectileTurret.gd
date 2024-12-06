extends Turret

var bulletSpeed : float = 100.0
var bulletSize : float = 1.0
#var bulletPierce : int = 1


func _ready() -> void:
	swivel = 7 #dart towers should be more agile than average
	attack_range = 300.0

func attack():
	print("attacking")
	#if is_instance_valid(current_target):
		#var projectileScene := preload("res://Scenes/turrets/projectileTurret/bullet/bulletBase.tscn")
		#var projectile := projectileScene.instantiate()
		#projectile.bullet_type = Data.turrets[turret_type]["bullet"]
		#projectile.damage = damage
		#projectile.speed = bulletSpeed
		#projectile.pierce = bulletPierce
		#Globals.projectilesNode.add_child(projectile)
		#projectile.position = position
		#projectile.target = current_target.position
	#else:
		#try_get_closest_target()
	
	
	
	#$LaunchPoint.add_child(preload("res://Scenes/turrets/projectileTurret/bullet/bulletBase.tscn").instantiate())
	var projectile := preload("res://Scenes/turrets/projectileTurret/bullet/bulletBase.tscn").instantiate()
	projectile.direction = $LaunchPoint.global_position.direction_to(target.global_position)
	projectile.global_position = $LaunchPoint.global_position
	projectile.target = target
	#projectile.seeking = true  #this is utterly terrifying to play against
	$"..".add_child(projectile)


func _on_attack_range_body_entered(_body: Node2D) -> void:
	print("enter")
	target = %Player
	
	#this handles the attack timing, and prevents indefinite stalling by going in and out of range
	if $AttackCooldown.paused:
		$AttackCooldown.paused = false
	else:
		$AttackCooldown.start()


func _on_attack_range_body_exited(_body: Node2D) -> void:
	print("exit")
	target = null
	$AttackCooldown.paused = true
