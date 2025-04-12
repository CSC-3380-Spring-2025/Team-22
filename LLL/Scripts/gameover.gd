extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var main_music: AudioStreamPlayer = $"/root/MainMenuMusic" as AudioStreamPlayer
	var game_over_music: AudioStreamPlayer = $gameover_music as AudioStreamPlayer
	var gameover_sprite: AnimatedSprite2D = $gameover_sprite as AnimatedSprite2D
	
	# Calls function to play game over sprite
	start_sprite_animation(gameover_sprite)
	
	# Calls function to stop main menu music and start game over music
	play_music(main_music, game_over_music)
	
# Stops main menu music and starts game over music
func play_music(main_music: AudioStreamPlayer, gameover_music : AudioStreamPlayer) -> int:
	main_music.stop()
	gameover_music.play()
	return 1

# When play again button is pressed, this calls the switch scene function
func _on_play_again_button_pressed() -> void:
	$play_again_button/music.play()
	switch_scenes()
	
# Switches scene back to main menu
func switch_scenes() -> int:
	$"/root/MainMenuMusic".play()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	return 1

# Starts game over screen spritem animation
func start_sprite_animation(sprite: AnimatedSprite2D) -> int:
	sprite.play("endgame")
	return 1
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
