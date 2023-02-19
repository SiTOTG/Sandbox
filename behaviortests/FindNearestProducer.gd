extends BTAction

func tick(actor:Node, blackboard:BTBlackboard):
	var cook = actor as Cook
	if not cook:
		return BTTickResult.FAILURE
	var target_producer = cook.get_nearest_production_for(blackboard.data.selected_material)
	blackboard.data.target_producer = target_producer
	return BTTickResult.SUCCESS
