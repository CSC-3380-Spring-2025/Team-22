extends Sprite2D

# Speed and height variables
@export var float_speed: float = 0.09
@export var float_height: float = 11.0

# Starting position
var start_y: float = 0.0

# Tracks when zzz is moving up or down
var going_up: bool = true

#  Declares starting position
func _ready() -> void:
	start_y = position.y

# Moving up and down 
func _process(_delta: float) -> void:
	if going_up:
		position.y -= float_speed
		if position.y < start_y - float_height:
			going_up = false
	else:
		position.y += float_speed
		if position.y > start_y + float_height:
			going_up = true
