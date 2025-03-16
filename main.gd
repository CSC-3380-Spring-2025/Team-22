extends Node2D

class_name Laika_health

#Declaring variables for health
const MAX_HEALTH = 20
var health = MAX_HEALTH
const DEATH = 0
var empty_bar = DEATH
const CURRENT_HEALTH = MAX_HEALTH

#Declare sprite node reference
var laika_health: Sprite2D

#Beginning health value
func _ready() -> void:
	laika_health = $laika_health/Laika
	set_health_label()
	$CanvasLayer/HealthBar.max_value = MAX_HEALTH
	set_health_bar()

#Updating health label / death annoucement
func set_health_label() -> void:
	if health > DEATH:
		$CanvasLayer/HealthLabel.text = "Health: %s" % health
	if health <= DEATH:
		$CanvasLayer/HealthLabel.text = "GAME OVER"

#Setting health bar
func set_health_bar() -> void:
	$CanvasLayer/HealthBar.value= health

#Player input keys
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		damage()	

#
func damage() -> void:
	health -= 1
	if health < DEATH:
		health = DEATH
		set_health_label()

	set_health_label()
	set_health_bar()
