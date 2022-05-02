tool
extends Room

onready var areanode = $Area
onready var shape = $Area/Shape

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var newshape = ConcavePolygonShape.new()
	newshape.set_faces(points)
	shape.shape = newshape

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(points)
