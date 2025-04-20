extends TextureButton



func on_play_button_pressed()-> void:
	get_tree().change_Scene("res://Scenes/Main_Stage.tscn")
	pass


func _on_pressed()-> void:
	get_tree().change_scene_to_file("res://Scenes/Main_Stage.tscn")
	pass
