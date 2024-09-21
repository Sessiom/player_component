extends Node2D


func _physics_process(delta):
	look_at(get_global_mouse_position() + ( 3.3333 * (Input.get_vector("left", "right", "up", "down"))))
	#This counter acts the movement from the player to keep the blaster still
	#look_at(get_global_mouse_position() + ( 3.33 * (Input.get_vector("left", "right", "up", "down"))))

func shoot():
	const BULLET = preload("res://scenes/projectile.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %projectile_origin.global_position
	new_bullet.global_rotation = rotation
	get_tree().current_scene.add_child(new_bullet)
