extends Node2D

@export var time = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timepass()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.a
func _process(delta: float) -> void:
	pass

func timepass():
	time = time + 1 #makes the time increase every time the player moves
	if (time < 1):
		print("PMI")
		$Background.texture = ResourceLoader.load("res://placeholderbkg.png")
	if (time > 1):
		print("PMI")
		$Background.texture = ResourceLoader.load("res://placeholderbkgN.png")
pass


func _on_main_menu_button_pressed() -> void:
	$main_menu_button/click.play()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	

func _on_play_pressed() -> void:
	$play/click.play()
	get_tree().paused = false
	$"/root/MainMenuMusic".play()
	

func _on_pause_pressed() -> void:
	$pause/click.play()
	$"/root/MainMenuMusic".stop()
	get_tree().paused = true
	
	
