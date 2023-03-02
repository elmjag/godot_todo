static func model_connect(target: Node, method: String):
    var model = target.get_node("/root/control/model")
    model.connect("model_updated", target, method)
