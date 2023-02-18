extends RigidBody3D

@export var my_custom_resource: MyCustomResource
var accel = Vector3.ZERO


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input_direction = Input.get_vector("ui_up", "ui_down", "ui_left", "ui_right")
	
	accel = Vector3(input_direction.x, 0, input_direction.y)
	apply_force(accel * delta * 300)
