extends Node

# Constants for preloading resource/alien scenes
const ROCK := "res://Scenes/Resource_scenes/rock.tscn"
const SCRAP_METAL := "res://Scenes/Resource_scenes/scrap_metal.tscn"
const LUNAR_LILY := "res://Scenes/Resource_scenes/lunar_lily.tscn"
const ALIEN_1 := "res://Scenes/alien1.tscn"
const ALIEN_2 := "res://Scenes/alien_2.tscn"
const FINAL_BOSS := "res://Scenes/final_boss.tscn"

# Each level (day) has different resources and alien
var levels = {
	"level_1": {
		"resources": [
			{
				"scene": preload(ROCK),
				"positions": [Vector2i(4, 5), Vector2i(8, 3), Vector2i(10, 10), Vector2i(15, 12), Vector2i(20, 8)]
			}
		],
		"aliens": [
			{
				"scene": preload(ALIEN_1),
				"positions": [Vector2i(5, 5)]
			}
		]
	},
	
	"level_2": {
		"resources": [
			{
				"scene": preload(ROCK),
				"positions": [Vector2i(6, 7), Vector2i(9, 11)]
			}
		],
		"aliens": [
			{
				"scene": preload(ALIEN_1),
				"positions": [Vector2i(5, 5), Vector2i(12, 6)]
			}
		]
	},

	"level_3": {
		"resources": [
			{
				"scene": preload(SCRAP_METAL),
				"positions": [Vector2i(5, 15), Vector2i(11, 9), Vector2i(17, 3)]
			}
		],
		"aliens": [
			{
				"scene": preload(ALIEN_1),
				"positions": [Vector2i(5, 5), Vector2i(12, 6), Vector2i(4,4)]
			}
		]
	},

	"level_4": {
		"resources": [
			{
				"scene": preload(SCRAP_METAL),
				"positions": [Vector2i(2, 4), Vector2i(6, 10), Vector2i(18, 12)]
			},
			{
				"scene": preload(ROCK),
				"positions": [Vector2i(3, 2), Vector2i(8, 5), Vector2i(10, 11)]
			}
		],
		"aliens": [
			{
				"scene": preload(ALIEN_1),
				"positions": [Vector2i(2, 11), Vector2i(1, 7), Vector2i(10,4)]
			},
			{
				"scene": preload(ALIEN_2),
				"positions": [Vector2i(2, 11), Vector2i(1, 7), Vector2i(10,4)]
			}
		]
	},

	"level_5": {
		"resources": [
			{
				"scene": preload(ROCK),
				"positions": [Vector2i(2, 4), Vector2i(6, 10), Vector2i(18, 12), Vector2i(24, 6)]
			}
		],
		"aliens": [
			{
				"scene": preload(ALIEN_1),
				"positions": [Vector2i(3,4)]
			},
			{
				"scene": preload(ALIEN_2),
				"positions": [Vector2i(2, 11), Vector2i(1, 7), Vector2i(10,4)]
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
				"positions": [Vector2i(5,4), Vector2i(9,3), Vector2i(1,7)]
			},
			{
				"scene": preload(ALIEN_2),
				"positions": [Vector2i(2, 11), Vector2i(1, 7), Vector2i(10,4)]
			}
		]
	},

	"level_7": {
		"resources": [
			{
				"scene": preload(LUNAR_LILY),
				"positions": [Vector2i(2, 4), Vector2i(6, 10)]
			},
			{
				"scene": preload(SCRAP_METAL),
				"positions": [Vector2i(3, 2), Vector2i(8, 5), Vector2i(10, 11), Vector2i(6, 10)]
			}
		],
		"aliens": [
			{
				"scene": preload(ALIEN_1),
				"positions": [Vector2i(8, 1), Vector2i(2, 3), Vector2i(12,4), Vector2i(8,3), Vector2i(9,6)]
			},
			{
				"scene": preload(ALIEN_2),
				"positions": [Vector2i(2, 11), Vector2i(1, 7), Vector2i(10,4)]
			}
		]
	},

	"level_8": {
		"resources": [
			{
				"scene": preload(SCRAP_METAL),
				"positions": [Vector2i(2, 4), Vector2i(6, 10), Vector2i(18, 12)]
			},
			{
				"scene": preload(ROCK),
				"positions": [Vector2i(3, 2), Vector2i(8, 5), Vector2i(10, 11)]
			}
		],
		"aliens": [
			{
				"scene": preload(ALIEN_1),
				"positions": [Vector2i(8, 1), Vector2i(2, 3), Vector2i(12,4), Vector2i(9,6), Vector2i(6,6)]
			},
			{
				"scene": preload(ALIEN_2),
				"positions": [Vector2i(3, 1), Vector2i(5, 3), Vector2i(2,4), Vector2i(11,6), Vector2i(6,12)]
			}
		]
	},

	"level_9": {
		"resources": [
			{
				"scene": preload(SCRAP_METAL),
				"positions": [Vector2i(2, 4), Vector2i(6, 10), Vector2i(18, 12)]
			}
		],
		"aliens": [
			{
				"scene": preload(ALIEN_1),
				"positions": [Vector2i(12, 1), Vector2i(3, 7), Vector2i(4,4), Vector2i(8,6)]
			},
			{
				"scene": preload(ALIEN_2),
				"positions": [Vector2i(14, 15), Vector2i(17, 11), Vector2i(12,11), Vector2i(14,20)]
			}
		]
	},

	"level_10": {
		"resources": [
			{
				"scene": preload(ROCK),
				"positions": [Vector2i(2, 4), Vector2i(6, 10), Vector2i(18, 12)]
			},
			{
				"scene": preload(LUNAR_LILY),
				"positions": [Vector2i(3, 2), Vector2i(8, 5), Vector2i(10, 11)]
			}
		], 
		"aliens": [
			{
				"scene": preload(FINAL_BOSS),
				"positions": [Vector2i(8, 10)]
			}
		]
	}
}
