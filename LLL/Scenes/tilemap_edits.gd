extends Node2D

const OVERWORLD_MSC : String = "res://Audio/through space.ogg"

var overworld_music: AudioStreamPlayer

# This was for testing, need to figure out how to implement level system across scenes.
var level_name = "level_2"


# Plays music for overworld scene and calls spawn resources function
func _ready() -> void:
	overworld_music = AudioStreamPlayer.new()
	add_child(overworld_music)
	overworld_music.stream = load(OVERWORLD_MSC)
	overworld_music.volume_db = -30
	overworld_music.play()

	spawn_resources()

# Function that pulls from resource_data.gd that has all the different days resources per outline
func spawn_resources():
	var resource_config = load("res://Scripts/Resource_scripts/resource_data.gd").new()
	var level_data = resource_config.levels.get(level_name, [])
	var tile_layer = $TileMap/tilemap
	var tile_size = tile_layer.tile_set.tile_size
	
	# Spawn resources
	for resource in level_data.get("resources", []):
		for tile_pos in resource.positions:
			var instance = resource.scene.instantiate()
			instance.z_index = 10
# I commented out the part below that connects to the tile map since it isn't on overworld scene yet
# So right now the resources are spawning on top of each other
			#var world_pos = tile_layer.map_to_local(tile_pos) + Vector2(tile_size) / 2
			#instance.position = world_pos
			add_child(instance)
	
	# Spawn enemies
	for aliens in level_data.get("aliens", []):
		for tile_pos in aliens.positions:
			var instance = aliens.scene.instantiate()
			instance.z_index = 20  
			instance.position = tile_layer.map_to_local(tile_pos) + Vector2(tile_size) / 2
			add_child(instance)
