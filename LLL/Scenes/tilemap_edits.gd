extends Node2D

var level_name = "level_1"

func _ready():
	spawn_resources()

func spawn_resources():
	var resource_config = load("res://Scripts/Resource_scripts/resource_data.gd").new()
	var resource_list = resource_config.levels.get(level_name, [])

	var tile_layer = $TileMap/tilemap
	var tile_size = tile_layer.tile_set.tile_size

	for resource in resource_list:
		for tile_pos in resource.positions:
			var instance = resource.scene.instantiate()
			instance.z_index = 10

			var world_pos = tile_layer.map_to_local(tile_pos) + Vector2(tile_size) / 2
			instance.position = world_pos

			add_child(instance)
	
