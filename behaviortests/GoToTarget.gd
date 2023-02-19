extends BTAction

func tick(actor:Node, blackboard:BTBlackboard):
	var cook = actor as Cook
	if not cook:
		return BTTickResult.FAILURE
	var target: Area2D = blackboard.data.target_producer.get_node("Proximity")
	if cook.destination != target:
		cook.destination = target
	if not cook.is_close_to_destination():
		return BTTickResult.RUNNING
	return BTTickResult.SUCCESS
