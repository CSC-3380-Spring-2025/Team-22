extends AudioStreamPlayer

var menu_music = load("res://Audio/Philip Aldous - RPG Title Screen Music Pack - 14 A World Of Snow.mp3")

func _ready() -> void:
	pass # Replace with function body.
	
func play_music(): 
	$Music.stream = menu_music
	$Music.play()
