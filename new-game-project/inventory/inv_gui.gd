extends Control

@onready var inventory : Inventory = preload("res://inventory/inventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

var show = false

func _ready() -> void:
	inventory.update.connect(update_slots)
	visible = false
	update_slots()

func update_slots():
	for i in range(min(inventory.slots.size(),slots.size())):
		slots[i].update_inv(inventory.slots[i])
		
func _process(delta: float) -> void:
	update_slots()
	if(Input.is_action_just_pressed("inventory")):
		toggle(show)
		
func toggle(v:bool):
	show = !v
	visible = show
