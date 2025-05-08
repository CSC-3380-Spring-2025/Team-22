extends Node


var current_level: int = 1

# Constants for preloading resource/alien scenes
const ROCK := "res://Scenes/Resource_scenes/rock.tscn"
const SCRAP_METAL := "res://Scenes/Resource_scenes/scrap_metal.tscn"
const LUNAR_LILY := "res://Scenes/Resource_scenes/lunar_lily.tscn"
const ALIEN_1 := "res://Art+Font/_alien_1.tscn"
const ALIEN_2 := "res://_alien_2.tscn"
const FINAL_BOSS := "res://Scenes/final_boss.tscn"

# Each level (day) has different resources and alien
var levels = {
	"level_1": {
		"resources": [
			{
				"scene": preload(ROCK),
				"positions": [Vector2i(4, 5), Vector2i(8, 3), Vector2i(-10, 10), Vector2i(15, 12), Vector2i(-15, 8)]
			}
		],
		"aliens": [
			{
				"scene": preload(ALIEN_1),
				"positions": [Vector2i(-5, 5)]
			}
		]
	},
	
	"level_2": {
		"resources": [
			{
				"scene": preload(ROCK),
				"positions": [Vector2i(-5, 5), Vector2i(3, 6)]
			}
		],
		"aliens": [
			{
				"scene": preload(ALIEN_1),
				"positions": [Vector2i(10, 10), Vector2i(-15, 12)]
			}
		]
	},

	"level_3": {
		"resources": [
			{
				"scene": preload(SCRAP_METAL),
				"positions": [Vector2i(4, 5), Vector2i(8, 3), Vector2i(-10, 10)]
			}
		],
		"aliens": [
			{
				"scene": preload(ALIEN_1),
				"positions": [Vector2i(-14, 10), Vector2i(15, 12), Vector2i(-12, 3)]
			}
		]
	},

	"level_4": {
		"resources": [
			{
				"scene": preload(SCRAP_METAL),
				"positions": [Vector2i(14, 12), Vector2i(-11, 8), Vector2i(-9, 3)]
			},
			{
				"scene": preload(ROCK),
				"positions": [Vector2i(-10, 14), Vector2i(7, 8), Vector2i(9, 10)]
			}
		],
		"aliens": [
			{
				"scene": preload(ALIEN_1),
				"positions": [ Vector2i(13, 20), Vector2i(1, 12), Vector2i(20, 8)]
			},
			{
				"scene": preload(ALIEN_2),
				"positions": [Vector2i(-4, 2), Vector2i(4, 18), Vector2i(13,6)]
			}
		]
	},

	"level_5": {
		"resources": [
			{
				"scene": preload(ROCK),
				"positions": [Vector2i(4, 5), Vector2i(-10, 10), Vector2i(15, 12), Vector2i(-13, 8)]
			}
		],
		"aliens": [
			{
				"scene": preload(ALIEN_1),
				"positions": [Vector2i(3,1)]
			},
			{
				"scene": preload(ALIEN_2),
				"positions": [ Vector2i(10, 10), Vector2i(-15, 12), Vector2i(20, 8)]
			}
		]
	},

	"level_6": {
		"resources": [
			{
				"scene": preload(ROCK),
				"positions": [Vector2i(1, 8)]
			}
		],
		"aliens": [
			{
				"scene": preload(ALIEN_1),
				"positions": [Vector2i(5,14), Vector2i(-9,3), Vector2i(1,7)]
			},
			{
				"scene": preload(ALIEN_2),
				"positions": [ Vector2i(-10, 16), Vector2i(-15, 12), Vector2i(-13, 8)]
			}
		]
	},

	"level_7": {
		"resources": [
			{
				"scene": preload(LUNAR_LILY),
				"positions": [Vector2i(-12, 4), Vector2i(-14, 20)]
			},
			{
				"scene": preload(SCRAP_METAL),
				"positions": [Vector2i(13, 2), Vector2i(-8, 5), Vector2i(-15, 11), Vector2i(6, 10)]
			}
		],
		"aliens": [
			{
				"scene": preload(ALIEN_1),
				"positions": [Vector2i(-14, 5), Vector2i(-10, 3), Vector2i(10, 10), Vector2i(15, 20), Vector2i(20, 8)]
			},
			{
				"scene": preload(ALIEN_2),
				"positions": [Vector2i(-212, 11), Vector2i(9, 7), Vector2i(10,14)]
			}
		]
	},

	"level_8": {
		"resources": [
			{
				"scene": preload(SCRAP_METAL),
				"positions": [Vector2i(-8, 4), Vector2i(-12, 10), Vector2i(18, 12)]
			},
			{
				"scene": preload(ROCK),
				"positions": [Vector2i(-10, 16), Vector2i(-6, 15), Vector2i(-3, 20)]
			}
		],
		"aliens": [
			{
				"scene": preload(ALIEN_1),
				"positions": [Vector2i(-12, 5), Vector2i(-8, 20), Vector2i(10, 18), Vector2i(15, 20), Vector2i(20, 8)]
			},
			{
				"scene": preload(ALIEN_2),
				"positions": [Vector2i(-4, 6), Vector2i(-14, 12), Vector2i(-3,9), Vector2i(-4,18), Vector2i(6,12)]
			}
		]
	},

	"level_9": {
		"resources": [
			{
				"scene": preload(SCRAP_METAL),
				"positions": [Vector2i(-15, 15), Vector2i(18, 20), Vector2i(22, 12)]
			}
		],
		"aliens": [
			{
				"scene": preload(ALIEN_1),
				"positions": [Vector2i(-12, 6), Vector2i(-9, 7), Vector2i(4,15), Vector2i(8,6)]
			},
			{
				"scene": preload(ALIEN_2),
				"positions": [Vector2i(-3, 18), Vector2i(-15, 3), Vector2i(15, 12), Vector2i(20, 8)]
			}
		]
	},

	"level_10": {
		"resources": [
			{
				"scene": preload(ROCK),
				"positions": [Vector2i(17, 4), Vector2i(-10, 3), Vector2i(-15, 12)]
			},
			{
				"scene": preload(LUNAR_LILY),
				"positions": [Vector2i(-13, 20), Vector2i(8, 17), Vector2i(10, 21)]
			}
		], 
		"aliens": [
			{
				"scene": preload(FINAL_BOSS),
				"positions": [Vector2i(12, 12)]
			}
		]
	}
}
