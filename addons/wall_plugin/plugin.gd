tool
extends EditorPlugin

const WallGizmos = preload("res://addons/wall_plugin/WallGizmos.gd")

var gizmos = WallGizmos.new()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _enter_tree():
    add_spatial_gizmo_plugin(gizmos)
    print("hII")


func _exit_tree():
    remove_spatial_gizmo_plugin(gizmos)

