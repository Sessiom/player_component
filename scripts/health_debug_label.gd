extends Label

@export var health : Health

func _process(delta):
	text = "Health: " + str(health.health)
	
