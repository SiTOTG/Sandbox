extends Label


func _on_cook_wood_value_changed(new_ammount):
	text = "Wood: %d" % [new_ammount]
