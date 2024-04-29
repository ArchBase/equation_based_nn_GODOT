extends RayCast3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var camera = $look/Camera3D
	var view = get_viewport()
	#print(view.camera)
	pass # Replace with function body.

var bonet = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_colliding():
		#print("colliding")
		pass
	else:
		#print("not colliding")
		pass


