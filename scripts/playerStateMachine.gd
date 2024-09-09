extends Node

class_name playerStateMachine

@export var player : CharacterBody2D 
@export var current_state : State 

var states : Array[State]

func _ready():
	#add all the states to the states Array
	for child in get_children():
		if(child is State):
			states.append(child)
			
			#set the states up with what they need to function
			child.player = player
			
		else:
			push_warning("Child " + child.name + " is not a State for playerStateMachine")

func _physics_process(delta):
	if(current_state.next_state != null):
		switch_states(current_state.next_state)

func check_if_can_move():
	return current_state.can_move
	
func switch_states(new_state : State):
	if(current_state != null):
		current_state.on_exit()
		current_state.next_state = null
		
	current_state = new_state
	
	current_state.on_enter()
