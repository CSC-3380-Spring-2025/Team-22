extends Node

# contants for preloading resouce scenes
const ROCK := "res://Scenes/Resource_scenes/rock.tscn"
const SCRAP_METAL := "res://Scenes/Resource_scenes/scrap_metal.tscn"
const LUNAR_LILY := "res://Scripts/Resource_scripts/lunar_lily.gd"

# Each level (day) has different resources and this manages them
var levels = {
	"level_1": [
		{
			"scene": preload(ROCK),
			"positions": [
				Vector2i(4, 5), Vector2i(8, 3), Vector2i(10, 10), Vector2i(15, 12),
				Vector2i(20, 8)
			]
		}
	],

	"level_2": [
		{
			"scene": preload(ROCK),
			"positions": [
				Vector2i(6, 7), Vector2i(9, 11)
			]
		}
	],

	"level_3": [
		{
			"scene": preload(SCRAP_METAL),
			"positions": [
				Vector2i(5, 15), Vector2i(11, 9), Vector2i(17, 3)
			]
		}
	],

	"level_4": [
		{
			"scene": preload(SCRAP_METAL),
			"positions": [
				Vector2i(2, 4), Vector2i(6, 10), Vector2i(18, 12)
			]
		},
		{
			"scene": preload(ROCK), 
			"positions": [
				Vector2i(3, 2), Vector2i(8, 5), Vector2i(10, 11) 
			]
		}
	],

	"level_5": [
		{
			"scene": preload(ROCK),
			"positions": [
				Vector2i(2, 4), Vector2i(6, 10), Vector2i(18, 12), Vector2i(24, 6)
			]
		}
	],
	"level_6": [
		{
			"scene": preload(ROCK),
			"positions": [
				Vector2i(1,8)
			]
		}
	],
	
	"level_7": [
		{
			"scene": preload(LUNAR_LILY),
			"positions": [
				Vector2i(2, 4), Vector2i(6, 10)
			]
		},
		{
			"scene": preload(SCRAP_METAL),
			"positions": [
				Vector2i(3, 2), Vector2i(8, 5), Vector2i(10, 11), Vector2i(6, 10)
			]
		}
	],
	
	"level_8": [
		{
			"scene": preload(SCRAP_METAL),
			"positions": [
				Vector2i(2, 4), Vector2i(6, 10), Vector2i(18, 12)
			]
		},
		{
			"scene": preload(ROCK), 
			"positions": [
				Vector2i(3, 2), Vector2i(8, 5), Vector2i(10, 11) 
			]
		}
	],
	"level_9": [
		{
			"scene": preload(SCRAP_METAL),
			"positions": [
				Vector2i(2, 4), Vector2i(6, 10), Vector2i(18, 12)
			]
		}
	],
	"level_10": [
		{
			"scene": preload(ROCK),
			"positions": [
				Vector2i(2, 4), Vector2i(6, 10), Vector2i(18, 12)
			]
		},
		{
			"scene": preload(LUNAR_LILY), 
			"positions": [
				Vector2i(3, 2), Vector2i(8, 5), Vector2i(10, 11) 
			]
		}
	]
}
