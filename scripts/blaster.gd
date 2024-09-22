extends Node2D

@onready var player = $"../.."

func _physics_process(delta):
	 # Get the global mouse position
	var global_mouse_pos = get_global_mouse_position()
	
	# Get the player's movement direction and scale it by speed
	var movement_offset = player.velocity * delta  # velocity is already direction * speed
	
	# Adjust the look_at position based on the player's movement
	look_at(global_mouse_pos + movement_offset)

func shoot():
	const BULLET = preload("res://scenes/projectile.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %projectile_origin.global_position
	new_bullet.global_rotation = rotation
	get_tree().current_scene.add_child(new_bullet)
