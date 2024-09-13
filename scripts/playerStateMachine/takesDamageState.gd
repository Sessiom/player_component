extends State

class_name takesDamage

@export var idle_state : State
@export var walk_state : State
@export var deals_damage_state : State
@export var death_state : State

func state_input(event : InputEvent):
	pass

func state_process(delta):
	if(playback.get_current_node() != "take_damage"):
		if(player.velocity == Vector2.ZERO):
			next_state = idle_state
		else:
			next_state = walk_state
	
func on_exit():
	pass
