extends Node2D

@export var item : Items

@onready var item_icon: Sprite2D = $Sprite2D

var player : Player
var can_collect = false

func _ready() -> void:
	item_icon.texture = item.icon

func _process(delta: float) -> void:
	if(player and can_collect):
		pick_up()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body is Player):
		player = body
		can_collect = true
		
func _on_area_2d_body_exited(body: Node2D) -> void:
	if(body is Player):
		can_collect = false
	
func pick_up():
	player.collect(item)
	queue_free()


