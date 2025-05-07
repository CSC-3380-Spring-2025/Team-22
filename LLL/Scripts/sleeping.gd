extends Node2D

const OVERWORLD_SCN: String = "res://Scenes/Overworld.tscn"
const OVERWORLD_MSC : String = "res://Audio/through space.ogg"

var lullaby: AudioStreamPlayer
var overworld_music: AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"/root/MainMenuMusic".stop()
	overworld_music = AudioStreamPlayer.new()
	add_child(overworld_music)
	overworld_music.stream = load(OVERWORLD_MSC)
	
	lullaby = $lullaby
	play_lullaby_and_return()

func play_lullaby_and_return() -> void:
	stop_overworld_music()
	lullaby.play()
	await back_to_overworld()
	
# Function to stop overworld music when switching to  scene
func stop_overworld_music() -> void:
	overworld_music.stop()

func back_to_overworld() -> void:
	#Adds a pause a brief pause before returning to the overworld and restarts overworld music 
	await get_tree().create_timer(2.8).timeout
	#overworld_music.play()
	get_tree().change_scene_to_file(OVERWORLD_SCN)
