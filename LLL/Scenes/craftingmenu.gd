extends Sprite2D

@onready var inv: Inv = preload("res://Scripts/inventory/playerInv.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

var havestick = false
var haverock = false

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			for i in range(min(inv.slots.size(), slots.size())):
				if(slots[i] == "sticks"):
					havestick = true
				if(slots[i] == "rock"):
					haverock = true
			if(havestick == true && haverock == true):
				print("raygun acquired")
