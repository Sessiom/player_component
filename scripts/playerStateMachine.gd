extends Node

class_name character_state_machine

var states : Array[State]

func _ready():
	#add all the states to the states Array
	for child in get_children():
		if(child is State):
			states.append(child)
		else:
			push_warning("Child " + child.name + " is not a State for playerStateMachine")
