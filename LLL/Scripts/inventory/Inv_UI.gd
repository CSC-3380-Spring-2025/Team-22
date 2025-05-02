extends Control

@onready var inv: Inv = preload("res://Scripts/inventory/playerInv.tres")
@onready var slots: Array[Node] = $NinePatchRect/GridContainer.get_children()

var is_open: bool = false

func _ready() -> void:
	add_to_group("inventory_ui")
	inv.update.connect(update_slots)
	update_slots()
	close()

func update_slots() -> void:
	for i: int in range(min(inv.slots.size(), slots.size())):
		slots[i].update(inv.slots[i])

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("tab"):
		if is_open:
			close()
		else:
			open()

func open() -> void:
	visible = true
	is_open = true

func close() -> void:
	visible = false
	is_open = false
