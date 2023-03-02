extends Node

class_name Model

signal model_updated(state)

enum Actions {ADD_TODO_ITEM}


class State:
	var todos = []
	
var state = State.new()


func _emit_model_updated_signal():
	emit_signal("model_updated", state)


func _ready():
	self.call_deferred("_emit_model_updated_signal")


func do(action, args):
	assert(action == Actions.ADD_TODO_ITEM)
	state.todos += args

	self.call_deferred("_emit_model_updated_signal")

