extends CharacterBody2D

@export var speed : float = 200.0

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var sprite : Sprite2D = $body
@onready var state_machine : playerStateMachine = $playerStateMachine

var direction : Vector2 = Vector2.ZERO



func _ready():
	animation_tree.active = true

func _physics_process(delta):
	
	#get_vector automatically normalizes vector
	direction = Input.get_vector("left", "right", "up", "down")
	
	#control whether to move or not
	#delta is automatically applied to velocity when move_and_slide() is called
	if direction != Vector2.ZERO && state_machine.check_if_can_move():
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO
		#velocity.x = move_toward(velocity.x, 0, speed)
		#velocity.y = move_toward(velocity.y, 0, speed)
		
	
	update_animation_parameters()
	update_facing_direction()
	move_and_slide()
	
func update_animation_parameters():
	animation_tree.set("parameters/move/blend_position", direction)

func update_facing_direction():
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true


func _on_health_health_changed(diff):
	#TODO figure out how to advance animation tree
	animation_player.play("take_damage")
	

func _on_health_health_depleted():
	#TODO figure out how to advance animation tree
	animation_player.play("death")
