extends Node2D

# Declare constants
const OVERWORLD_SCN: String = "res://Scenes/Overworld.tscn"

# Variable for music/audio
var lullaby: AudioStreamPlayer

# Stops main menu music and references lullaby music node
func _ready() -> void:
	$"/root/MainMenuMusic".stop()

	lullaby = $lullaby
	play_lullaby_and_return()

# Plays music for lullaby and calls function to return to overworld 
func play_lullaby_and_return() -> void:
	lullaby.play()
	await back_to_overworld()

# Returns to over world with a brief timer
func back_to_overworld() -> void:
	await get_tree().create_timer(2.8).timeout
	get_tree().change_scene_to_file(OVERWORLD_SCN)
