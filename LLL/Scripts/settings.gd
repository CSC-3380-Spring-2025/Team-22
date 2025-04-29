extends Control

const MAIN_MENU: String = "res://Scenes/main_menu.tscn"

# Declare variable for sound 
var back_sound: AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _process(delta: float) -> void:
	back_sound = $back_button/click_back

# Changes scene back to main menu when back button clicked
func _on_back_button_pressed() -> void:
	back_sound.play()
	get_tree().change_scene_to_file(MAIN_MENU)

# Turns off music when pressed
func _on_music_off_pressed() -> void:
	back_sound.play()
	get_node("/root/MainMenuMusic").stop()

# Turns on music when pressed
func _on_music_on_pressed() -> void:
	back_sound.play()
	get_node("/root/MainMenuMusic").play()
