extends Node


func _ready():
	var button = get_node("Button")
	button.connect("pressed", self, "_on_pressed")


func _on_pressed():
	var text = get_node("LineEdit").text
	var model = get_node("/root/control/model")

	model.do(Model.Actions.ADD_TODO_ITEM, [text])
