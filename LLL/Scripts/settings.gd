extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_texture_button_pressed() -> void:
	$back_button/click_back.play()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_texture_button_2_pressed() -> void:
	$"/root/MainMenuMusic".stop()

func _on_texture_button_3_pressed() -> void:
	$"/root/MainMenuMusic".play()
