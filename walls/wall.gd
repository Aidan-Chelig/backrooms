tool
extends Spatial

export var handle_position: Vector3 = Vector3(0,0,-1) setget set_handle
export var width: float = 1.0 setget set_width
export var show_handle: bool = false setget set_show_handle

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var handle: Spatial 


func set_show_handle(show):
	if !Engine.editor_hint:
		return

	show_handle = show
	print(show_handle)
	if show:
		if !find_node("handle"):
			handle = Spatial.new()
			handle.name = "handle"
			add_child(handle)
			handle.set_owner(get_tree().edited_scene_root)
			print(handle_position)
			handle.transform.origin = handle_position
			print(handle.transform.origin)
			print(handle.global_transform.origin)
	else:
		var noderemove = find_node("handle")
		if noderemove:
			remove_child(noderemove)
	

func set_width(new_width):
	width = new_width
	transform_wall()

func set_handle(new_handle):
	handle_position = new_handle
	if find_node("handle"):
		if $handle.is_inside_tree():
			$handle.transform.origin = new_handle
			handle_position = new_handle
	transform_wall()

func transform_wall():
	if find_node("body"):
		if $body.is_inside_tree():
			$body.scale = Vector3(width, 1, $body.global_transform.origin.distance_to(to_global(handle_position))/2)
			$body.look_at(to_global(handle_position), Vector3.UP)

func _enter_tree():
	pass	

func _exit_tree():
	if Engine.editor_hint:
		remove_child(handle)

# Called when the node enters the scene tree for the first time.
func _ready():
	transform_wall()


func _init():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(_delta):
	if(find_node("handle")):
		if $handle.is_inside_tree():
			handle_position = $handle.transform.origin
	transform_wall()
