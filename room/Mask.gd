extends Camera

export var main_cam_path: NodePath

var main_cam: Camera

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	main_cam = get_node(main_cam_path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	global_transform = main_cam.global_transform