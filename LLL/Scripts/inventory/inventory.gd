extends Resource

class_name Inv

signal update

@export var slots: Array[InvSlot] = []

func insert(item: Item) -> void:
	var itemslots: Array[InvSlot] = slots.filter(func(slot: InvSlot) -> bool:
		return slot.item == item
	)
	if !itemslots.is_empty():
		itemslots[0].amount += 1
	else:
		var emptyslots: Array[InvSlot] = slots.filter(func(slot: InvSlot) -> bool:
			return slot.item == null
		)
		if !emptyslots.is_empty():
			emptyslots[0].item = item
			emptyslots[0].amount = 1
	update.emit()

func remove(item: Item) -> void:
	var itemslots: Array[InvSlot] = slots.filter(func(slot: InvSlot) -> bool:
		return slot.item == item
	)
	if !itemslots.is_empty():
		itemslots[0].amount -= 1
		if itemslots[0].amount == 0:
			itemslots[0].item = null
	update.emit()
	
func getCount(item: Item) -> int:
	var itemslots: Array[InvSlot] = slots.filter(func(slot: InvSlot) -> bool:
		return slot.item == item
	)
	if !itemslots.is_empty():
		return itemslots[0].amount
	else:
		return 0
