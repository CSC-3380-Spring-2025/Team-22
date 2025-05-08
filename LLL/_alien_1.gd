extends TextureButton

# Changes scene to battle when clicked
func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Battle.tscn")
	GlobalStats.currentlyFighting = 1;
