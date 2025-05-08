extends TextureButton

func _on_pressed() -> void:
	GlobalStats.currentlyFighting = 2
	Transition.start_transition("res://Scenes/Battle.tscn")
