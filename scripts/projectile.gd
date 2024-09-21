extends Node2D

var travelled_distance : float = 0

func _physics_process(delta):
	const SPEED := 500
	const RANGE := 500
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()
		
	

func _on_hitbox_area_entered(area):
	queue_free()
