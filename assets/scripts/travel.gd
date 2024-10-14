extends Node2D

@onready var control: Control = $Control
@onready var world_map: Node2D = $world_map

@export var locations:Array

var transportation_mode : String
var current_loc

func _ready() -> void:
	current_loc = get_tree().current_scene.get_scene_file_path()
	control.visible = false

func _process(delta: float) -> void:
	travel_control()

func travel_control():
	for i in get_node("Control").get_children():
		if(i.button_pressed):
			transportation_mode = i.name
			world_map.visible = true
	if(world_map.visible and Input.is_action_just_pressed("esc")):
		world_map.visible = false
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body is Player):
		control.visible = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if(body is Player):
		control.visible = false
		world_map.visible = false
		



func _on_location_1_pressed() -> void:
	Handle_travel(locations[0])


func _on_location_2_pressed() -> void:
	Handle_travel(locations[1])


func Handle_travel(new_location:String):
	if(current_loc == new_location):
		print("Can't teleport to same location")
	else:
		get_tree().change_scene_to_file(new_location)
