extends Node2D

# Declare constants 
const OVERWORLD_MSC : String = "res://Audio/through space.ogg"
const SLEEP_SCN : String = "res://Scenes/sleeping.tscn"
const BATTLE_SCN : String = "res://Scenes/Battle.tscn"
const MAINMENU_SCN : String = "res://Scenes/main_menu.tscn"
const RESOURCES : String = "res://Scripts/Resource_scripts/resource_data.gd"

var overworld_music: AudioStreamPlayer
var click: AudioStreamPlayer

# This was for testing, need to figure out how to implement level system across scenes.
var level_name = "level_5"

# Plays music for overworld scene and calls spawn resources function
func _ready() -> void:
	click = $Laika/MainMenu/Click
	overworld_music = AudioStreamPlayer.new()
	add_child(overworld_music)
	overworld_music.stream = load(OVERWORLD_MSC)
	overworld_music.volume_db = -30
	overworld_music.play()

	spawn_resources()

# Function that pulls from resource_data.gd that has all the different days resources per outline
func spawn_resources():
	var resource_config = preload(RESOURCES).new()
	var level_data = resource_config.levels.get(level_name, [])
	var tile_layer = $TileMap/tilemap
	var tile_size = tile_layer.tile_set.tile_size
	
	# Spawn resources
	for resource in level_data.get("resources", []):
		for tile_pos in resource.positions:
			var instance = resource.scene.instantiate()
			instance.z_index = 100
			var world_pos = tile_layer.map_to_local(tile_pos) + Vector2(tile_size) / 2
			instance.position = world_pos
			add_child(instance)
	
	# Spawn aliens 1, 2, and final boss depending on level
	for aliens in level_data.get("aliens", []):
		for tile_pos in aliens.positions:
			var instance = aliens.scene.instantiate()
			instance.z_index = 100  
			instance.position = tile_layer.map_to_local(tile_pos) + Vector2(tile_size) / 2
			add_child(instance)
			
# Changes scene to main menu
func _on_main_menu_pressed() -> void:
	click.play()
	await get_tree().create_timer(0.8).timeout
	get_tree().change_scene_to_file(MAINMENU_SCN)

# Changes scene to sleep scene
func _on_den_pressed() -> void:
	await get_tree().create_timer(0.8).timeout
	get_tree().change_scene_to_file(SLEEP_SCN)

# If we can't trigger battle scene with collision, we can use this button
func _on_battle_pressed() -> void:
	get_tree().change_scene_to_file(BATTLE_SCN)
	
