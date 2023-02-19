class_name Cook
extends Sprite2D

signal wood_value_changed(new_ammount: int)

@export var speed: = 250

var destination: Area2D = null
var target_producer: Producer

var wood_carried:= 0:
	set(value):
		wood_carried = value
		wood_value_changed.emit(value)

func action() -> int:
	print("Other option")
	return BTTickResult.SUCCESS

func get_nearest_production_for(target_material: Material1) -> Producer:
	var producers = get_tree().get_nodes_in_group("Producer") as Array[Producer]
#	var nearest_producer: Producer = producers[0]
#	for node in producers:
#		var producer: Producer = node as Producer
#		if not producer: continue
#		print(producer.produces.name)
#		pass
#
	return producers[0]

func _process(delta):
	if is_instance_valid(destination):
		global_position = global_position.move_toward(destination.global_position, speed*delta)

func is_close_to_destination():
	return destination in $InteractRange.get_overlapping_areas()

func fetch_from_producer(producer: Producer):
	if len(producer.produced) > 0 and $FetchTimer.is_stopped():
		target_producer = producer
		$FetchTimer.start()

func _on_fetch_timer_timeout():
	target_producer.pop_material()
	wood_carried += 1
