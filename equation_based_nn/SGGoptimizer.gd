extends Node

class_name Stranger_Good_Gradient_Optimizer

var Configuration = Config.new()
var network:Equation_Network
var prev_prediction:Array = []

func generate_random_gradient():
	var length = len(network.get_weights())
	var gradient:Array = []
	for i in range(length):
		gradient.append(randf_range(Configuration.config["min"], Configuration.config["max_weight_random_value"]))

func _init(network_arg:Equation_Network):
	network = network_arg

func train_network(epochs):
	for epoch in range(epochs):
		prev_prediction = network.run_equation([1, 1])
		
	
	
	
	
	
	
	
	
