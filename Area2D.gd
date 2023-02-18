extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().get_root().set_transparent_background(true) 
	var bla = load("witch.aseprite")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = get_global_mouse_position()


func _on_area_entered(area):
	print("Area entered")


func _on_body_entered(body):
	print("Body entered")
