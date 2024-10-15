extends Node2D

var on_area : bool = false
@export var next_loc : String

func _ready() -> void:
	GlobalScript.door_location = global_position
	GlobalScript.get_data()

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("interact") and on_area):
		get_tree().change_scene_to_file(next_loc)
		GlobalScript.used_door = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body is Player):
		on_area = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if(body is Player):
		on_area = true
