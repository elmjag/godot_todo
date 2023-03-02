extends Node

class_name Model

signal model_updated(state)

enum Actions {ADD_TODO_ITEM, SET_NEW_TODO}


class State:
    var todos = []
    var new_todo = ""

var state = State.new()


func _emit_model_updated_signal():
    emit_signal("model_updated", state)


func _ready():
    self.call_deferred("_emit_model_updated_signal")


func do(action, args):
    match action:
        Actions.SET_NEW_TODO:
            state.new_todo = args
        Actions.ADD_TODO_ITEM:
            state.todos += [state.new_todo]

    self.call_deferred("_emit_model_updated_signal")

