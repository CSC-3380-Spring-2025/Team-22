extends Panel

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_display
@onready var amount_text: Label = $CenterContainer/Panel/Label

var slot_data: InvSlot = null

func update(slot: InvSlot) -> void:
	slot_data = slot
	print("Slot bound to item: ", slot.item)
	if slot.item == null:
		item_visual.visible = false
		amount_text.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = slot.item.texture
		item_visual.scale = Vector2(1, 1)
		if slot.amount > 1:
			amount_text.visible = true
			amount_text.text = str(slot.amount)
		else:
			amount_text.visible = false

func get_drag_data(_pos: Vector2) -> Variant:
	if slot_data and slot_data.item:
		var preview := item_visual.duplicate()
		preview.scale = Vector2(0.8, 0.8)
		set_drag_preview(preview)
		return slot_data
	return null

func can_drop_data(_pos: Vector2, data: Variant) -> bool:
	return typeof(data) == TYPE_OBJECT and data is InvSlot and data != slot_data

func drop_data(_pos: Vector2, data: Variant) -> void:
	if data and data is InvSlot:
		var temp_item: InvItem = data.item
		var temp_amount: int = data.amount

		data.item = slot_data.item
		data.amount = slot_data.amount

		slot_data.item = temp_item
		slot_data.amount = temp_amount

		get_tree().call_group("inventory_ui", "update_slots")
