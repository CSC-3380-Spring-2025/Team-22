extends StaticBody2D

func _ready() -> void:
	pass

func _on_area_2d_area_entered(area: Node) -> void:
	get_tree().change_scene_to_file("res://Scenes/sleeping.tscn")
