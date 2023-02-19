extends BTAction

@export var material_to_use: Material1 = preload("res://behaviortests/wood.tres")

func tick(actor:Node, blackboard:BTBlackboard):
	blackboard.data.selected_material = material_to_use
	return BTTickResult.SUCCESS
