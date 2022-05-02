extends EditorSpatialGizmo

var handles = PoolVector3Array()

func redraw():
    clear()
    var wall = get_spatial_node()
    
    print(wall.to)
    handles.push_back(Vector3(0,0,0))
    handles.push_back(wall.to_local(wall.to))

    add_handles(handles, get_plugin().get_material("handles", self))

func set_handle(index, camera, point):
    #TODO get world space coords from screenspace
    if index == 1:
        var wall = get_spatial_node()
        wall.to = self.get_handle_value(1).to_global()