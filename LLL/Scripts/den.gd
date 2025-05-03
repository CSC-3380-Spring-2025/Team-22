extends Area2D

var player: CharacterBody2D = null

func _on_interactable_area_body_entered(body: Node) -> void:
	if body.is_in_group("player"):  # Using groups instead of checking name
		get_tree().change_scene_to_file("res://Scenes/sleeping.tscn")
