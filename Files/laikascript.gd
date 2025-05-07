extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(0,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta):
	if Input.is_action_pressed("move_right"):
		position += 10 
