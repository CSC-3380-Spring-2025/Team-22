extends Node2D

const MUSIC_STAGE : String = "res://Audio/through space.ogg"

var mainstage_music: AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mainstage_music = AudioStreamPlayer.new()
	add_child(mainstage_music)
	mainstage_music.stream = load(MUSIC_STAGE)
	mainstage_music.volume_db = -20
	mainstage_music.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
