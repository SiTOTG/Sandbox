extends Sprite2D

@export var consumes: Material1
@export var produces: Material1
@export var max_materials := 5

var consumable := []
var produced := []

func _ready():
	$Label.text = name

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if len(produced) < max_materials:
		pass
