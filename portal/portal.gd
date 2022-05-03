tool
extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(NodePath) onready var follow_cam
export(NodePath) onready var reference_node


onready var portal_cam = $portalView/Handle/portalCam
onready var body = $body

onready var portal_view = $portalView
onready var bodytracker = $bodyTracker
onready var camtracker = $bodyTracker/camTracker;

onready var handle = $portalView/Handle


# Called when the node enters the scene tree for the first time.
func _ready():
	handle.set_disable_scale(true)
	bodytracker.set_disable_scale(true)
	camtracker.set_disable_scale(true)


func _on_viewport_size_changed():
	var size = OS.get_real_window_size();
	portal_view.size = size;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if follow_cam && reference_node:
		handle.global_transform = get_node(reference_node).global_transform
		bodytracker.global_transform = body.global_transform
		camtracker.global_transform = get_node(follow_cam).global_transform
		portal_cam.transform = camtracker.transform
