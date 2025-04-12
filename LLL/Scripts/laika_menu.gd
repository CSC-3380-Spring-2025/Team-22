extends Sprite2D

@export var float_speed := 1.0        # how fast it floats
@export var float_radius := 10.0      # how far it floats in each direction

var start_position := Vector2.ZERO
var time := 0.0

func _ready() -> void:
	start_position = position

func _process(delta: float) -> void:
	time += delta
	position.x = start_position.x + cos(time * float_speed) * float_radius
	position.y = start_position.y + sin(time * float_speed) * float_radius
