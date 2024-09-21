extends State

class_name walkState

@export var idle_state : State
@export var deals_damage_state : State
@export var takes_damage_state : State
@export var death_state : State


func state_input(event : InputEvent):
	pass
	
func state_process(delta):
	if(player.velocity == Vector2.ZERO):
		next_state = idle_state
	if(playback.get_current_node() == "take_damage"):
		next_state = takes_damage_state
	if(playback.get_current_node() == "death" or 
	   playback.get_current_node() =="death_2"):
		next_state = death_state
