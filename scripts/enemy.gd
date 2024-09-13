extends StaticBody2D

@onready var animation_player : AnimationPlayer = $AnimationPlayer


func _on_health_health_changed(diff):
	animation_player.play("hurt")


func _on_health_health_depleted():
	animation_player.play("death")
