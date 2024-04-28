extends Node2D

var nn:Equation_Network
# Called when the node enters the scene tree for the first time.



func _ready():
	nn = Equation_Network.new(4, 2)
	print(nn.run_equation([0.5, 3]))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
