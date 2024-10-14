extends States

var keys = ["w","a","s","d"]

func Enter():
	pass
	
func Update(delta:float):
	for i in keys:
		if(Input.is_action_just_pressed(i)):
			Transition("movements")

func Transition(stateName:String):
	state_transition.emit(self, stateName)
