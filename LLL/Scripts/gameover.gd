extends Node2D

# Constant variable for switching back to main menu
const MAIN_MENU: String = "res://Scenes/main_menu.tscn"

# Variables for music and sprite
var main_music: AudioStreamPlayer
var game_over_music: AudioStreamPlayer
var gameover_sprite: AnimatedSprite2D
var button_music: AudioStreamPlayer

func _ready() -> void:
	main_music = get_node("/root/MainMenuMusic") as AudioStreamPlayer
	game_over_music = $gameover_music as AudioStreamPlayer
	gameover_sprite = $gameover_sprite as AnimatedSprite2D
	button_music = $play_again_button/music as AudioStreamPlayer

	# Calls sprite animation 
	start_sprite_animation()
	
	# Calls music function
	play_music()

# Stops main menu music and starts game over music
func play_music() -> void:
	main_music.stop()
	game_over_music.play()
	
# Starts sprite animation for game over screen
func start_sprite_animation() -> void:
	gameover_sprite.play("endgame")

func _process(delta: float) -> void:
	pass

# Button sounds play when button pressed and calls switch scene function
func _on_play_again_button_pressed() -> void:
	button_music.play()
	await get_tree().create_timer(0.8).timeout
	get_tree().change_scene_to_file(MAIN_MENU)
	main_music.play()
