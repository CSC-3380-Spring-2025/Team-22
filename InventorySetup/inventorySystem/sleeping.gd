extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"/root/MainMenuMusic".stop()
	$lullaby.play()
	await get_tree().create_timer(6.8).timeout
	$"/root/MainMenuMusic".play()
	get_tree().change_scene_to_file("res://Scenes/Main_Stage.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
