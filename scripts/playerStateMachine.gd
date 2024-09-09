extends Node

class_name playerStateMachine

@export var current_state : State 

var states : Array[State]

func _ready():
	#add all the states to the states Array
	for child in get_children():
		if(child is State):
			states.append(child)
			
			#set the states up with what they need to function
			
		else:
			push_warning("Child " + child.name + " is not a State for playerStateMachine")

func check_if_can_move():
	return current_state.can_move
