extends Node3D

var nn = Equation_Network.new(16, 4)
# Called when the node enters the scene tree for the first time.

var e=false
var b


var driver = Driver.new(nn)

func _ready():
	nn = Equation_Network.new(16, 4)
	print(nn.run_equation([0, 0, 0]))
	var driver = Driver.new(nn)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	driver.drive_car()
	if e:
		print("bonet hit")
		print(b)
	pass



func _on_area_3d_2_body_entered(body):
	b = body
	e=true
	print("9rfs")


func _on_area_3d_2_body_exited(body):
	e=false
