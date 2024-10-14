extends CharacterBody2D
class_name Player

@onready var wand: MeshInstance2D = $Sprite2D/wand

@export var new_loc:Vector2
@export var initial_state : States
var current_state : States
var states : Dictionary = {}

func _ready() -> void:
	for i in get_node("states").get_children():
		if(i is States):
			states[i.name.to_lower()] = i
			i.state_transition.connect(Change_state)
			
		if(initial_state):
			initial_state.Enter()
			current_state = initial_state

func Change_state(previous_state:States,next_state:String):
	var new_state = states.get(next_state.to_lower())
	if(current_state):
		current_state.Exit()
		
	new_state.Enter()
	current_state = new_state
	
func _process(delta: float) -> void:
	Wand()
	if(current_state):
		current_state.Update(delta)
		
func _physics_process(delta: float) -> void:
	move_and_slide()

#temporary (migrate later)
func Wand():
	wand.look_at(get_global_mouse_position())

