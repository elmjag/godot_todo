extends Node

const utils = preload("res://scripts/utils.gd")
var model
var button

func _ready():
    model = get_node("/root/control/model")

    # listen to 'add' button clicks
    button = get_node("Button")
    button.connect("pressed", self, "_on_pressed")

    var line_edit = get_node("LineEdit")
    line_edit.connect("text_changed", self, "_on_text_changed")

    # listen to model changes
    utils.model_connect(self, "_model_updated")


func _on_pressed():
    model.do(Model.Actions.ADD_TODO_ITEM, null)


func _on_text_changed(new_text):
    model.do(Model.Actions.SET_NEW_TODO, new_text)


func _model_updated(state):
    button.disabled = (state.new_todo == "")
