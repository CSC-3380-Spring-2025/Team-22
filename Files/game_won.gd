extends Node2D

const MAIN_MENU: String = "res://Scenes/main_menu.tscn"
var GameWon_sprite: AnimatedSprite2D

func _ready() -> void:
	GameWon_sprite = $GameWon_sprite as AnimatedSprite2D
	GameWon_sprite.play("gamewon")

func _process(delta: float) -> void:
	pass

func _on_play_again_button_pressed() -> void:
	#button_music.play()
	await get_tree().create_timer(0.8).timeout
	get_tree().change_scene_to_file(MAIN_MENU)
