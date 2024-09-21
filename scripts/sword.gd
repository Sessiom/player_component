extends Node2D

@onready var animation_player : AnimationPlayer = $AnimationPlayer


func _physics_process(delta):
	look_at(get_global_mouse_position() + ( 3.3333 * (Input.get_vector("left", "right", "up", "down"))))

func swing():
	animation_player.play("swing")
	
