extends States

@export var player : Player
var speed = 500

func Enter():
	pass

func Update(delta:float):
	var dir = Input.get_vector('a','d','w','s').normalized()
	player.velocity = dir * speed
	
	if(!dir):
		Transition("idle")
	
func Transition(stateName:String):
	state_transition.emit(self,stateName)
