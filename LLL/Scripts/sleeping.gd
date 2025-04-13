extends Node2D

const MAIN_STAGE: String = "res://Scenes/Main_Stage.tscn"
const MUSIC_STAGE : String = "res://Audio/through space.ogg"

var lullaby: AudioStreamPlayer
var mainstage_music: AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"/root/MainMenuMusic".stop()
	mainstage_music = AudioStreamPlayer.new()
	add_child(mainstage_music)
	mainstage_music.stream = load(MUSIC_STAGE)
	
	lullaby = $lullaby
	play_lullaby_and_return()

func play_lullaby_and_return() -> void:
	stop_mainstage_music()
	lullaby.play()
	await back_to_mainstage()
	
# Function to stop main menu music when switching to battle scene
func stop_mainstage_music() -> void:
	mainstage_music.stop()

func back_to_mainstage() -> void:
	#Adds a pause a brief pause before returning to the main stage and restarts main stage music 
	await get_tree().create_timer(6.8).timeout
	get_tree().change_scene_to_file(MAIN_STAGE)
	mainstage_music.play()
