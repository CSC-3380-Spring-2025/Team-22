extends CharacterBody2D

<<<<<<< Updated upstream
@export var speed = 400
=======

@export var speed : int = 400
@onready var _animation_player : AnimatedSprite2D = $AnimatedSprite2D
const msScript = preload("res://Scenes/main_stage.gd") #mainstage script
var mainstage : msScript = msScript.new()
>>>>>>> Stashed changes

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down") # uses the input map found int he project 
	velocity = input_direction * speed # Speed modifier

func _physics_process(delta):
	get_input() # gets the current input
	move_and_slide() # moves the actual icon
