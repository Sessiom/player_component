extends Node2D

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var player = get_tree().current_scene.get_node("Player")


func _physics_process(delta):
	 # Get the global mouse position
	var global_mouse_pos = get_global_mouse_position()
	
	# Get the player's movement direction and scale it by speed
	var movement_offset = player.velocity * delta  # velocity is already direction * speed
	
	# Adjust the look_at position based on the player's movement
	look_at(global_mouse_pos + movement_offset)

func swing():
	animation_player.play("swing")
	
