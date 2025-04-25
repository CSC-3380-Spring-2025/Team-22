extends Node

#Each level (day) has different resources and this file manages it 
var levels = {
	"level_1": [
		{
			"scene": preload("res://Scenes/Resource_scenes/Rock.tscn"),
			"positions": [
				Vector2i(4, 5), Vector2i(8, 3), Vector2i(10, 10), Vector2i(15, 12),
				Vector2i(20, 8), Vector2i(6, 18)
			]
		}
	],

	"level_2": [
		{
			"scene": preload("res://Scenes/Resource_scenes/Rock.tscn"),
			"positions": [
				Vector2i(6, 7), Vector2i(9, 11), Vector2i(14, 14)
			]
		}
	],

	"level_3": [
		{
			"scene": preload("res://Scenes/Resource_scenes/Scrap Metal.tscn"),
			"positions": [
				Vector2i(5, 15), Vector2i(11, 9), Vector2i(17, 3), Vector2i(13, 6)
			]
		}
	],

	"level_4": [
		{
			"scene": preload("res://Scenes/Resource_scenes/Scrap Metal.tscn"),
			"positions": [
				Vector2i(2, 4), Vector2i(6, 10), Vector2i(18, 12), Vector2i(24, 6)
			]
		},
		{
			"scene": preload("res://Scenes/Resource_scenes/Rock.tscn"),
			"positions": [
				Vector2i(2, 4), Vector2i(6, 10), Vector2i(18, 12), Vector2i(24, 6)
			]
		}
	],
	"level_5": [
		{
			"scene": preload("res://Scenes/Resource_scenes/Rock.tscn"),
			"positions": [
				Vector2i(2, 4), Vector2i(6, 10), Vector2i(18, 12), Vector2i(24, 6)
			]
		}
	]
}
