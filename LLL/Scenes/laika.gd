extends CharacterBody2D


@export var speed = 400
@onready var _animation_player = $Sprite2D2
const msScript = preload("res://Scenes/main_stage.gd") #mainstage script
var mainstage = msScript.new()

func get_input()-> void:

	var input_direction = Input.get_vector("left", "right", "up", "down") # uses the input map found int he project 
	velocity = input_direction * speed # Speed modifier
	if Input.is_action_pressed("left"):
		_animation_player.play("Left")
	elif Input.is_action_pressed("right"):
		_animation_player.play("Right")
	elif Input.is_action_pressed("up"):
		_animation_player.play("Up")
	elif Input.is_action_pressed("down"):
		_animation_player.play("Down")
	#else:
		#_animation_player.stop()
	

func _physics_process(_delta: float) -> void:
	get_input() # gets the current input
	move_and_slide() # moves the actual icon
