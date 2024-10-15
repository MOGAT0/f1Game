extends Resource
class_name Inventory

signal update

@export var slots : Array[Inv_slot]

func insert(item: Items):
	var itemSlot = slots.filter(func(slot): return slot.item == item)
	if(!itemSlot.is_empty()):
		itemSlot[0].amount += 1
	else:
		var emptySlot = slots.filter(func(slot): return slot.item == null)
		if(!emptySlot.is_empty()):
			emptySlot[0].item = item
			emptySlot[0].amount = 1
			
	update.emit()
