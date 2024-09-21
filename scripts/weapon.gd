extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		child.set_visible(false)
		child.set_physics_process(false)
