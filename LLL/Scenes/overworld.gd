extends Node2D


@onready var tilemap = $TileMap
@onready var level_label = $Laika/LevelLabel

# Declare constants 
const OVERWORLD_MSC : String = "res://Audio/through space.ogg"
const SLEEP_SCN : String = "res://Scenes/sleeping.tscn"
const BATTLE_SCN : String = "res://Scenes/Battle.tscn"
const MAINMENU_SCN : String = "res://Scenes/main_menu.tscn"
const RESOURCES : String = "res://Scripts/Resource_scripts/resource_data.gd"

var overworld_music: AudioStreamPlayer
var click: AudioStreamPlayer

# This was for testing, need to figure out how to implement level system across scenes.
#var level_name = "level_5"

# Plays music for overworld scene and calls spawn resources function
func _ready() -> void:
	click = $Laika/MainMenu/Click
	overworld_music = AudioStreamPlayer.new()
	add_child(overworld_music)
	overworld_music.stream = load(OVERWORLD_MSC)
	overworld_music.volume_db = -30
	overworld_music.play()

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
			
# Changes scene to main menu
func _on_main_menu_pressed() -> void:
	click.play()
	await get_tree().create_timer(0.8).timeout
	get_tree().change_scene_to_file(MAINMENU_SCN)

# Changes scene to sleep scene
func _on_den_pressed() -> void:
	resource_data.current_level += 1  # Increment the level
	update_level_label()

	if resource_data.current_level <= 10:
		print("Now loading level_%d" % resource_data.current_level)
		get_tree().change_scene_to_file(SLEEP_SCN)
		return
		
	
func update_level_label() -> void:
	if resource_data.current_level <= 10:
		level_label.text = "Day: %d" % resource_data.current_level
