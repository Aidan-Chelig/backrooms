extends EditorSpatialGizmoPlugin

const PointGizmo = preload("./pointGizmo.gd")
const Wall = preload("res://wall.gd")

func create_gizmo(spatial):
	if spatial is Wall:
		return PointGizmo.new()
	else:
		return null

func _init():
	create_material("main", Color(1,0,0))
	create_handle_material("handles")

func get_name():
    return "CustomNode"