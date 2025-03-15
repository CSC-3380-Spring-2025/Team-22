extends Node2D

class_name Alien1_health

#Declaring variables for health
const MAX_HEALTH = 20
var health = MAX_HEALTH
const DEATH = 0
var empty_bar = DEATH
const CURRENT_HEALTH = MAX_HEALTH

#Health bar frame set up
var health_bar_texture_path = "res://Healthbar/alien1_healthbar_frames/pixil-frame-"

#Beginning health value
func _ready() -> void:
	set_health_label()
	set_health_bar()

#Updating health label / death annoucement
func set_health_label() -> void:
	if health > DEATH:
		$CanvasLayer/HealthAlien1.text = "HEALTH: %s" % health
	else:
		$CanvasLayer/HealthAlien1.text = "VICTORY"

#Setting health bar texture based on health
func set_health_bar() -> void:
	var health_percentage = health / MAX_HEALTH
	var frame_index = clamp(0 + health, 0, 20)
	
	#Load correct texture for health bar frame
	var texture_path = health_bar_texture_path +str(frame_index) + ".png"
	
	#Set the texture of the HealthBar TextureRect
	$CanvasLayer/HealthBar2.texture = load(texture_path)
	
	print("Health: %d" % health)
	print("Texture Path: %s" % texture_path)
	
#Player input keys
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"): #placeholder to show movement but needs to be synced with alien attack
		damage()	

#Damage implementation
func damage() -> void:
	health -= 1
	
	if health < DEATH:
		health = DEATH
		
	set_health_label()
	set_health_bar()
