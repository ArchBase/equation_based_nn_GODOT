extends Node
class_name Equation_Network

var equation:String
var no_of_weights:int
var selected_output_indices:Array = []
var weights:Array = []
var Configuration = Config.new()	
var w:Array = []
var y:Array = []

func _init(no_of_weights_arg:int, max_count_of_y:int):
	no_of_weights = no_of_weights_arg
	
	for i in range(no_of_weights):
		weights.append(randf_range(Configuration.config["min_weigth_random_value"], Configuration.config["max_weight_random_value"]))
	w = weights
	#print(w)
	for i in range(max_count_of_y):
		y.append(null)
	
	
func run_equation(inputs_arg:Array):
	var x = inputs_arg
	y[0] = (w[0]*x[0] + w[1]*x[1] + w[2]*x[2]) + w[3]
	y[1] = (w[4]*x[0] + w[5]*x[1] + w[6]*x[2]) + w[7]
	y[2] = (w[8]*x[0] + w[9]*x[1] + w[10]*x[2]) + w[11]
	y[3] = (w[12]*x[0] + w[13]*x[1] + w[14]*x[2]) + w[15]
	return [y[0], y[1], y[2], y[3]]
func get_weights():
	return weights.duplicate(true)
func set_weights(weights_arg):
	weights = weights_arg
func negate_gradient(gradient:Array):
	for i in range(len(gradient)):
		gradient[i] = -gradient[i]
	return gradient
func generate_random_gradient():
	var length = len(weights)
	var gradient:Array = []
	for i in range(length):
		gradient.append(randf_range(Configuration.config["min"], Configuration.config["max_weight_random_value"]))
func apply_gradient(gradient):
	for i in range(len(gradient)):
		weights[i] += gradient[i]


