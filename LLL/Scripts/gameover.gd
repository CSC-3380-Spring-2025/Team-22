extends Node2D

const MAINMENU_SCN: String = "res://Scenes/main_menu.tscn"

var main_music: AudioStreamPlayer
var game_over_music: AudioStreamPlayer
var gameover_sprite: AnimatedSprite2D
var button_music: AudioStreamPlayer

func _ready() -> void:
	main_music = get_node("/root/MainMenuMusic") as AudioStreamPlayer
	game_over_music = $gameover_music as AudioStreamPlayer
	gameover_sprite = $gameover_sprite as AnimatedSprite2D
	button_music = $play_again_button/music as AudioStreamPlayer

	start_sprite_animation()
	play_music()

func play_music() -> void:
	main_music.stop()
	game_over_music.play()

func _on_play_again_button_pressed() -> void:
	button_music.play()
	switch_scenes()

func switch_scenes() -> void:
	main_music.play()
	get_tree().change_scene_to_file(MAINMENU_SCN)

func start_sprite_animation() -> void:
	gameover_sprite.play("endgame")

func _process(delta: float) -> void:
	pass
