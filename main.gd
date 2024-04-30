extends Node3D

var nn = Equation_Network.new(16, 4)
# Called when the node enters the scene tree for the first time.
var reset = false
var car_hit=false
var b
var time_driven = 0
var car
var distance = 0
var prev_distance = 1000
var gradient
var gradient_improving = false
var drive = false

var driver = Driver.new(nn)
var epoch = 0
var epochs = 10

func _ready():
	nn = Equation_Network.new(16, 4)
	#print(nn.run_equation([0, 0, 0]))
	var driver = Driver.new(nn)
	car = $car





func train():
	pass
func _processk(delta):
	driver.drive_car()
	#nn.apply_gradient(nn.generate_random_gradient())
	if car_hit:
		driver.nn.apply_gradient(driver.nn.generate_random_gradient())
		#car_hit = false
	
	
func _process(delta):
	if epoch < epochs and Globals.drive == false:
		if gradient_improving:
			pass
		else:
			gradient = driver.nn.generate_random_gradient()
		driver.nn.apply_gradient(gradient.duplicate(true))
		
		Globals.drive = true
		print("driving")
	if Globals.drive:
		driver.drive_car()
		
	
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _processi(delta):
	
	if gradient_improving:
		gradient_improving = false
	else:
		gradient_improving = false
		gradient = driver.nn.generate_random_gradient()
	driver.nn.apply_gradient(gradient.duplicate(true))
	if reset:
		reset = false
		time_driven = 0
	driver.drive_car()
	time_driven += delta
	
	
	# Calculate the distance between the two points
	
	#print(car.position)
	#print(car.rotation)
	if car_hit:
		car_hit = false
		reset = true
		print("car hit")
		#print(car.rotation)
		var car_position_global = car.global_transform.origin
		car.position = Vector3(-2.293015, 0.20187, 6.262867)
		car.rotation = Vector3(-0.014981, -0.000062, -0.002747)
	#if reset:
		var finish_line = $obstacles/obstacle10.global_transform.origin
		
		var distance = car_position_global.distance_to(finish_line)
		
		if distance <= prev_distance:
			# model improved
			gradient_improving = true
		else:
			gradient_improving = false
			driver.nn.apply_gradient(driver.nn.negate_gradient(gradient.duplicate(true)))
			prev_distance = distance
	
			
		
		print("distance travelled: " + str(distance))
		

func _on_area_3d_2_body_entered(body):
	car_hit = true
	var car_position_global = car.global_transform.origin
	epoch += 1
	b = body
	car_hit=true
	
	Globals.drive = false
	reset = true
	#print("9rfs")
	print("car hit")
	#print(car.rotation)
	
	car.position = Vector3(-2.293015, 0.20187, 6.262867)
	car.rotation = Vector3(-0.014981, -0.000062, -0.002747)
	#if reset:
	var finish_line = $obstacles/obstacle10.global_transform.origin
	
	var distance = car_position_global.distance_to(finish_line)
	if distance <= prev_distance:
		gradient_improving = true
		prev_distance = distance
	else:
		gradient_improving = false
		driver.nn.apply_gradient(driver.nn.negate_gradient(gradient.duplicate(true)).duplicate(true))
		print("minimum distance: " + str(prev_distance))
	print(distance)


func _on_area_3d_2_body_exited(body):
	car_hit=false
