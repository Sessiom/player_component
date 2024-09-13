extends Node2D

@onready var animation_player : AnimationPlayer = $AnimationPlayer

func swing():
	animation_player.play("swing")
	
