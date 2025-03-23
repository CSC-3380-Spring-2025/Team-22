extends CharacterBody2D


@export var speed = 400
@onready var _animation_player = $AnimationPlayer
const msScript = preload("res://Scenes/main_stage.gd") #mainstage script
var mainstage = msScript.new()
var weapon = 0
var health_potion = 0
var mana_potion = 0

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down") # uses the input map found int he project 
	velocity = input_direction * speed # Speed modifier
	if Input.is_action_pressed("move_left"):
		_animation_player.play("WalkingLeft")
	elif Input.is_action_pressed("move_right"):
		_animation_player.play("WalkingRight")
	elif Input.is_action_pressed("move_up"):
		_animation_player.play("WalkingUp")
	elif Input.is_action_pressed("move_down"):
		_animation_player.play("WalkingDown")
	else:
		_animation_player.stop()
	

func _physics_process(delta):
	get_input() # gets the current input
	move_and_slide() # moves the actual icon
	
func add_item(item):
	if(item == "weapon"):
		weapon += 1
	if(item == "health_potion"):
		health_potion += 1
	if(item == "mana_potion"):
		mana_potion += 1
	pass
