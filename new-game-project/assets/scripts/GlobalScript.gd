extends Node

var used_door : bool = false
var door_location : Vector2 = Vector2.ZERO
var travel_location : Vector2 = Vector2.ZERO
var player : Player

func _process(delta: float) -> void:
	print(used_door)


func get_data():
	if(player):
		if(used_door):
			player.global_position = door_location
		else:
			player.global_position = travel_location
	
