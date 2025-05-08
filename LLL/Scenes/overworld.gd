extends Node2D

# References scene nodes
@onready var tilemap = $TileMap
@onready var level_label = $CanvasLayer/LevelLabel

# Constants 
const OVERWORLD_MSC : String = "res://Audio/through space.ogg"
const SLEEP_SCN : String = "res://Scenes/sleeping.tscn"
const BATTLE_SCN : String = "res://Scenes/Battle.tscn"
const MAINMENU_SCN : String = "res://Scenes/main_menu.tscn"
const RESOURCES : String = "res://Scripts/Resource_scripts/resource_data.gd"

# Variables for scene music/audio
var overworld_music: AudioStreamPlayer
var click: AudioStreamPlayer

# Plays music for overworld scene and calls spawn resources function
func _ready() -> void:
	click = $CanvasLayer/MainMenu/Click
	
	overworld_music = AudioStreamPlayer.new()
	add_child(overworld_music)
	overworld_music.stream = load(OVERWORLD_MSC)
	overworld_music.volume_db = -22
	overworld_music.play()


# Spawn level resources and update level label
	var level_key = "level_%d" % resource_data.current_level
	spawn_resources(level_key)
	update_level_label()

# Function that pulls from resource_data.gd that has all the different days resources per outline
func spawn_resources(level_key: String) -> void:
	var level_data = resource_data.levels.get(level_key, {})
	var tilemap = $TileMap
	var tile_size = tilemap.tile_set.tile_size

	
	# Spawn resources
	for resource_data in level_data.get("resources", []):
		var scene = resource_data.scene
		for tile_pos in resource_data.positions:
			var instance = scene.instantiate()
			instance.z_index = -50
			var local_pos = Vector2(tile_pos.x * 64, tile_pos.y * 64)
			instance.position = local_pos + Vector2(tile_size) / 2
			add_child(instance)
	
	# Spawn aliens 1, 2, and final boss depending on level
	for alien_data in level_data.get("aliens", []):
		var scene = alien_data.scene
		for tile_pos in alien_data.positions:
			var instance = scene.instantiate()
			instance.z_index = -10
			var local_pos = Vector2(tile_pos.x * 64, tile_pos.y * 64)
			instance.position = local_pos + Vector2(tile_size) / 2
			add_child(instance)
			
# Button that changes scene to main menu
func _on_main_menu_pressed() -> void:
	click.play()
	await get_tree().create_timer(0.8).timeout
	get_tree().change_scene_to_file(MAINMENU_SCN)

# Den button that changes scene to sleep scene and increments each day (level)
func _on_den_pressed() -> void:
	resource_data.current_level += 1 
	update_level_label()
	
	# Keeps the game from passing 10 days
	if resource_data.current_level <= 10:
		get_tree().change_scene_to_file(SLEEP_SCN)
		return
# Updates Day label 
func update_level_label() -> void:
	if resource_data.current_level <= 10:
		level_label.text = "Day: %d" % resource_data.current_level
