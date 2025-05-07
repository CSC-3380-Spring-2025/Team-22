extends StaticBody2D

var player: CharacterBody2D = null

func _on_interactable_area_body_entered(body) -> void:
	get_tree().change_scene_to_file("res://Scenes/Battle_alien_type2.tscn")
	hide()
