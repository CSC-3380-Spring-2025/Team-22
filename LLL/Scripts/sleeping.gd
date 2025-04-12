extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var main_music: AudioStreamPlayer = $"/root/MainMenuMusic" as AudioStreamPlayer
	var lullaby: AudioStreamPlayer = $lullaby as AudioStreamPlayer
	
	play_music(main_music, lullaby)

# Function to stop main menu music when switching to battle scene
func play_music(main_music: AudioStreamPlayer, lullaby : AudioStreamPlayer) -> int:
	main_music.stop()
	lullaby.play()
	
	#Adds a pause a brief pause before returning to the main stage and restarts main menu music 
	await get_tree().create_timer(6.8).timeout
	$"/root/MainMenuMusic".play()
	get_tree().change_scene_to_file("res://Scenes/Main_Stage.tscn")
	return 1
