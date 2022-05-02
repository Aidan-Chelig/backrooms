tool
extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var follow_cam_input: NodePath setget fcs
export var centered_around_input: Vector3

onready var mask_cam = $mask/maskRoot/maskCam
onready var portal_cam = $portalView/Handle/portalCam
onready var body = $body

onready var mask_view = $mask
onready var portal_view = $portalView
onready var texture_rect = $CanvasLayer/portalTex


onready var maskroot = $mask/maskRoot

onready var handle = $portalView/Handle

var follow_cam: Camera;

func fcs(newfcs):
	follow_cam = get_node(newfcs)
	follow_cam_input = newfcs

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().root.connect("size_changed", self, "_on_viewport_size_changed");
	if follow_cam_input:
		follow_cam = get_node(follow_cam_input)


func _on_viewport_size_changed():
	var size = OS.get_real_window_size();
	print(size);
	mask_view.size = size;
	portal_view.size = size;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if follow_cam:
		mask_cam.global_transform = follow_cam.global_transform
		maskroot.global_transform = body.global_transform;
		maskroot.scale = Vector3(1,1,1);
		portal_cam.transform = mask_cam.transform
