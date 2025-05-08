extends TextureButton

func _on_pressed() -> void:
	GlobalStats.currentlyFighting = 1
	Transition.start_transition("res://Scenes/Battle.tscn")
