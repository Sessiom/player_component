extends State

class_name idleState

@export var walk_state : State
@export var deals_damage_state : State
@export var takes_damage_state : State
@export var death_state : State

func state_input(event : InputEvent):
	pass
