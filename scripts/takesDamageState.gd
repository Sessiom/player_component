extends State

class_name takesDamage

@export var idle_state : State
@export var walk_state : State
@export var deals_damage_state : State
@export var death_state : State

func state_input(event : InputEvent):
	pass
