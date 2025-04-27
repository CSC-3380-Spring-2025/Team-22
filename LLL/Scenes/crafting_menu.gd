extends Control

@onready var inv: Inv = preload("res://Scripts/inventory/playerInv.tres")
@onready var slots: Array[Node] = $inv_UI/NinePatchRect/GridContainer.getchildren()

var havestick = false
var haverock = false

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_global_rect().has_point(event.position):
			for i in range(min(inv.slots.size(), slots.size())):
				if(slots[i].value == "sticks"):
					havestick = true
				if(slots[i].value == "rock"):
					haverock = true
			if(havestick == true && haverock == true):
				print("raygun acquired")
