extends Node3D

class_name Driver

var nn:Equation_Network
var accelerate = false
var brake = false
var steer_left = false
var steer_right = false
var distance_travelled:int

func _init(nn_arg:Equation_Network):
	nn = nn_arg

func drive_car():
	#var grad = nn.generate_random_gradient()
	#nn.apply_gradient(nn.generate_random_gradient())
	var instructions = nn.run_equation([Globals.ray_cast_left, Globals.ray_cast_center, Globals.ray_cast_right])
	#print(instructions)
	#print(instructions)
	Globals.accelerate = instructions[0]
	Globals.brake = instructions[1]
	if instructions[2] > 0:
		Globals.steer_left = 1
	else:
		Globals.steer_left = -1
	if instructions[3] > 0:
		Globals.steer_right = 1
	else:
		Globals.steer_right = -1
func _process(delta):
	if Globals.drive:
		drive_car()
	
