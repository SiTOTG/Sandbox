class_name Producer
extends Sprite2D

@export var consumes: Material1
@export var produces: Material1
@export var max_materials := 5

var consumable := []
var produced := []

func _ready():
	$Label.text = name
	if produces == null:
		printerr("Production cannot be null!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	try_to_produce()
	if $ProductionTimer.is_stopped():
		$ProgressBar.value = 0
	else:
		var progress = ($ProductionTimer.wait_time - $ProductionTimer.time_left) / $ProductionTimer.wait_time
		$ProgressBar.value = progress * 100

func try_to_produce() -> bool:
	# Is already producing
	if not $ProductionTimer.is_stopped():
		return false
	# Has max ammount
	if len(produced) >= max_materials:
		return false
	# Has not enough resources to produce
	if consumes != null and len(consumable) == 0:
		return false

	$ProductionTimer.start()
	return true


func _on_production_timer_timeout():
	if produces == null: return
	produced.append(produces.duplicate())
	$Stock.text = str(len(produced))

func pop_material() -> Material1:
	var popped = produced.pop_front()
	$Stock.text = str(len(produced))
	return produced.pop_front()
