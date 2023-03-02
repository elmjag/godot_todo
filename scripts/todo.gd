extends VBoxContainer

const utils = preload("res://scripts/utils.gd")


func _ready():
    utils.model_connect(self, "_model_updated")


func _model_updated(state):
    for c in get_children():
        c.queue_free()

    for item in state.todos:
        var label = Label.new()
        label.text = item
        add_child(label)
