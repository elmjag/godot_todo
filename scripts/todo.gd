extends VBoxContainer


func _ready():
	var model = get_node("/root/control/model")
	model.connect("model_updated", self, "_model_updated")
	

func _model_updated(state):
	for c in get_children():
		c.queue_free()
		
	for item in state.todos:
		var label = Label.new()
		label.text = item
		add_child(label)
