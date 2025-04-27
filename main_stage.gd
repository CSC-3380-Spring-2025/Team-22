extends Node2D

const BKG_NORMAL := "res://placeholderbkg.png"
const BKG_NIGHT := "res://placeholderbkgN.png"
const MUSIC_STAGE := "res://Audio/through space.ogg"
const SLEEP_SCENE := "res://Scenes/sleeping.tscn"
const MAIN_MENU_SCENE := "res://Scenes/main_menu.tscn"
var main_music: AudioStreamPlayer
var mainstage_music: AudioStreamPlayer

@export var time = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timepass()
	
	main_music = get_node("/root/MainMenuMusic") as AudioStreamPlayer
	
	mainstage_music = AudioStreamPlayer.new()
	add_child(mainstage_music)
	mainstage_music.stream = load(MUSIC_STAGE)

	#var main_stage_music: AudioStreamPlayer = $main_stage_music as AudioStreamPlayer
	
	play_music(main_music, mainstage_music)

# Function to stop main menu music when switching to battle scene
func play_music(main_music: AudioStreamPlayer, new_music: AudioStreamPlayer) -> void:
	if main_music:
		main_music.stop()
	if new_music:
		new_music.play()

func timepass():
	time = time + 1 #makes the time increase every time the player moves
	if (time < 1):
		print("PMI")
		$Background.texture = ResourceLoader.load(BKG_NORMAL)
	if (time > 1):
		print("PMI")
		$Background.texture = ResourceLoader.load(BKG_NIGHT)


func _on_main_menu_button_pressed() -> void:
	$main_menu_button/click.play()
	get_tree().change_scene_to_file(MAIN_MENU_SCENE)
	

func _on_play_pressed()-> void:
	$play/click.play()
	get_tree().paused = false
	play_music(main_music, mainstage_music)
	

func _on_pause_pressed() -> void:
	$pause/click.play()
	if main_music:
		main_music.stop()
	get_tree().paused = true

func _on_sleep_pressed() -> void:
	get_tree().change_scene_to_file(SLEEP_SCENE)
