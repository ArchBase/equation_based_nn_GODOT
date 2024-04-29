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
	print(w)
	for i in range(max_count_of_y):
		y.append(null)
	
	
func run_equation(inputs_arg:Array):
	var x = inputs_arg
	y[0] = w[0] * x[0] + w[1]
	y[1] = w[2] * x[1] + w[3]
	return [y[0], y[1]]
func get_weights():
	return weights.duplicate(true)
func set_weights(weights_arg):
	weights = weights_arg

	
	
