extends Node3D


var nn:Equation_Network
var accelerate = false
var brake = false
var steer_left = false
var steer_right = false
var distance_travelled:int

func _init(nn_arg:Equation_Network):
	nn = nn_arg

func drive_car():
	pass


