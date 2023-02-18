extends BTAction

func tick(actor:Node, blackboard:BTBlackboard):
	print("Hello, world")
	var cook = actor as Cook
	if not cook:
		return BTTickResult.FAILURE
	return BTTickResult.SUCCESS

