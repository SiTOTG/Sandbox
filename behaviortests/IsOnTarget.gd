extends BTAction

func tick(actor:Node, blackboard:BTBlackboard):
	var cook = actor as Cook
	if not cook:
		return BTTickResult.FAILURE
	cook.destination = null
	cook.fetch_from_producer(blackboard.data.target_producer)
	return BTTickResult.SUCCESS

