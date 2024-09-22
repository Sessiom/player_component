extends CharacterBody2D

@export var speed : float = 200.0
@export var weapon_select : int = 0 : set = set_weapon, get = get_weapon

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var sprite : Sprite2D = $body
@onready var state_machine : playerStateMachine = $playerStateMachine
@onready var weapon : Node2D = $weapon


var is_weapon_equipped : bool = false
var prev_weapon : int = -1
var direction : Vector2 = Vector2.ZERO
var playback : AnimationNodeStateMachinePlayback

func _ready():
	animation_tree.active = true
	playback = animation_tree["parameters/playback"]

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
	
	#weapon_select
	if Input.is_action_just_pressed("weapon_slot_0"):
		is_weapon_equipped = false
		playback.travel("move")
		change_weapon(0)
		print("hands")
	if Input.is_action_just_pressed("weapon_slot_1"):
		is_weapon_equipped = true
		playback.travel("move_item_equipped")
		change_weapon(1)
		print("sword")
	if Input.is_action_just_pressed("weapon_slot_2"):
		is_weapon_equipped = true
		playback.travel("move_item_equipped")
		change_weapon(2)
		print("blaster")
	
	if Input.is_action_just_pressed("scroll_up"):
		weapon_select += 1
		if weapon_select > 2:
			weapon_select = 1
		if weapon_select == 0:
			is_weapon_equipped = false
			playback.travel("move")
			change_weapon(weapon_select)
		else:
			is_weapon_equipped = true
			playback.travel("move_item_equipped")
			change_weapon(weapon_select)
			
	if Input.is_action_just_pressed("scroll_down"):
		weapon_select -= 1
		if weapon_select < 1:
			weapon_select = 2
		if weapon_select == 0:
			is_weapon_equipped = false
			playback.travel("move")
			change_weapon(weapon_select)
		else:
			is_weapon_equipped = true
			playback.travel("move_item_equipped")
			change_weapon(weapon_select)
		
	#attack input
	if Input.is_action_just_pressed("attack"):
		if weapon.get_child(weapon_select).has_method("swing"):
			$weapon/sword.swing()
		elif weapon.get_child(weapon_select).has_method("shoot"):
			$weapon/blaster.shoot()
		
	
	update_animation_parameters()
	update_facing_direction()
	move_and_slide()
	
func update_animation_parameters():
	if is_weapon_equipped:
		animation_tree.set("parameters/move_item_equipped/blend_position", direction)
	else:
		animation_tree.set("parameters/move/blend_position", direction)

func update_facing_direction():
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true


func _on_health_health_changed(diff):
	if is_weapon_equipped:
		playback.travel("take_damage_item_equipped")
	else:
		playback.travel("take_damage")

func _on_health_health_depleted():
	if is_weapon_equipped:
		playback.travel("death_2")
	else:
		playback.travel("death")
	
func set_weapon(value: int):
	weapon_select = value
	
func get_weapon():
	return weapon_select
	
func change_weapon(value: int):
			weapon.get_child(prev_weapon).set_visible(false)
			weapon.get_child(prev_weapon).set_physics_process(false)
			set_weapon(value)
			#setting global_rotation to fix weapon flickering (offset of -20 for weapon pivot)
			var direction = (get_global_mouse_position() - global_position) - Vector2(0,-20)
			weapon.get_child(weapon_select).global_rotation = direction.angle()
			weapon.get_child(weapon_select).set_visible(true)
			weapon.get_child(weapon_select).set_physics_process(true)
			prev_weapon = weapon_select
