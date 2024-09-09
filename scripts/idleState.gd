extends State

class_name idleState

@export var walk_state : State
@export var deals_damage_state : State
@export var takes_damage_state : State
@export var death_state : State

func state_input(event : InputEvent):
	if(event.is_action_pressed("up") or 
	   event.is_action_pressed("down") or 
	   event.is_action_pressed("left") or 
	   event.is_action_pressed("right")):
		next_state = walk_state
