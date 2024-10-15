extends Node
class_name AnimationControl

@export var player : Player
@export var animationPlayer : AnimationPlayer
var player_speed : int = 300

var direction : Dictionary = {
	"RIGHT": (Vector2(0, -player_speed) + Vector2(player_speed, 0)).normalized() * player_speed,
	"LEFT": (Vector2(0, -player_speed) + Vector2(-player_speed, 0)).normalized() * player_speed,
	
	"right": (Vector2(0, player_speed) + Vector2(player_speed, 0)).normalized() * player_speed,
	"left": (Vector2(0, player_speed) + Vector2(-player_speed, 0)).normalized() * player_speed,
	
	"Left": Vector2(-player_speed, 0),
	"Right": Vector2(player_speed, 0),
	
	"Up": Vector2(0, -player_speed),
	"Down": Vector2(0, player_speed)
}

var current_direction = "Down"

func _process(delta: float) -> void:
	HandleInputs()

func HandleInputs():
	var tolerance = 0.01

	for i in direction:
		if direction[i].distance_to(player.velocity) < tolerance:
			current_direction = i
			break
	
	if player.velocity != Vector2.ZERO:
		Walk(current_direction.to_lower())
	else:
		Idle(current_direction.to_lower() + "_idle")

func Idle(anim_name: String):
	animationPlayer.play(anim_name)

func Walk(anim_name: String):
	animationPlayer.play(anim_name)
