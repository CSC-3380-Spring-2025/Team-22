extends Node2D

var gameStarted : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("res://Audio/game over bop.mp3")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_texture_button_pressed() -> void:
	$play_again_button/music.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
