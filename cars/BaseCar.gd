extends VehicleBody3D


@export var STEER_SPEED = 1.5
@export var STEER_LIMIT = 0.6
var steer_target = 0
@export var engine_force_value = 40


func _physics_process(delta):
	
	var speed = linear_velocity.length()*Engine.get_frames_per_second()*delta
	traction(speed)
	$Hud/speed.text=str(round(speed*3.8))+"  KMPH"

	var fwd_mps = transform.basis.x.x
	steer_target = Globals.steer_left - Globals.steer_right
	steer_target *= STEER_LIMIT
	if Globals.brake > 0:
	# Increase engine force at low speeds to make the initial acceleration faster.

		engine_force = engine_force_value
	else:
		engine_force = 0
	if Globals.accelerate > 0:
		# Increase engine force at low speeds to make the initial acceleration faster.
		if fwd_mps >= -1:
			engine_force = -engine_force_value
		else:
			brake = 1
	else:
		brake = 0.0
		
	if Input.is_action_pressed("ui_select"):
		brake=3
		$wheal2.wheel_friction_slip=0.8
		$wheal3.wheel_friction_slip=0.8
	else:
		$wheal2.wheel_friction_slip=3
		$wheal3.wheel_friction_slip=3
	steering = move_toward(steering, steer_target, STEER_SPEED * delta)



func traction(speed):
	apply_central_force(Vector3.DOWN*speed)








func _on_body_entered(body):
	print("hai")


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("haidddddddddddddddddddddddd")


func _on_area_3d_2_body_entered(body):
	print("haidddddddddddddddddddddddd")
