extends Panel

@onready var item_icon: Sprite2D = $CenterContainer/Panel/item_icon
@onready var label: Label = $CenterContainer/Panel/Label
@onready var actions: Panel = $actions

var i


func _ready() -> void:
	actions.visible = false

func update_inv(slot : Inv_slot):
	i = slot
	if(!slot.item):
		item_icon.visible = false
		label.visible = false
	else:
		item_icon.visible = true
		item_icon.texture = slot.item.icon
		label.text = str(slot.amount)
		if(slot.amount > 1):
			label.visible = true
				
			


func _on_button_pressed() -> void:
	if(i.item):
		actions.visible = !actions.visible
		


func _on_drop_pressed() -> void:
	if(i.item):
		i.amount -= 1
		
		if(i.amount <= 0):
			i.item = null
			actions.visible = !actions.visible
