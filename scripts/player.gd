extends CharacterBody2D

@onready var animation_tree : AnimationTree = $AnimationTree
@onready var sprite : Sprite2D = $body
var direction : Vector2 = Vector2(0,0)

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	direction = Input.get_vector("left", "right", "up", "down")
	
	update_animation()
	update_facing_direction()
	
func update_animation():
	animation_tree.set("parameters/move/blend_position", direction)

func update_facing_direction():
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true
