extends Control

# Plays audio for button and changes scene to main menu
func _on_texture_button_pressed() -> void:
	$TextureButton/click_back.play()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
