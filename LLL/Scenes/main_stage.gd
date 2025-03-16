extends Node2D

@export var time = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timepass()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.a
func _process(delta: float) -> void:
	pass

func timepass():
	time = time + 1 #makes the time increase every time the player moves
	if (time < 1):
		print("PMI")
		$Background.texture = ResourceLoader.load("res://placeholderbkg.png")
	if (time > 1):
		print("PMI")
		$Background.texture = ResourceLoader.load("res://placeholderbkgN.png")
pass
