extends Panel

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_display
@onready var amount_text: Label = $CenterContainer/Panel/Label

func update(slot: InvSlot) -> void:
	if slot.item == null:
		item_visual.visible = false
		amount_text.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = slot.item.icon
		if slot.amount > 1:
			amount_text.visible = true
			amount_text.text = str(slot.amount)
		else:
			amount_text.visible = false
