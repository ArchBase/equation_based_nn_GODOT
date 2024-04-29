extends MeshInstance3D

var hit = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if hit:
	#	print("bonet hit")
	#else:
	#	print("bonet not hit")
	pass


func _on_car_body_entered(body):
	hit = true
	print("entered")


func _on_car_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("entered")
	pass # Replace with function body.
