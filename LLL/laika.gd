extends Area2D
@export var speed = 600
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.z_index = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float ) -> void:
	var velocity = Vector2.ZERO 
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		position.x += 300 * delta
		$AnimatedSprite2D.animation = "walk_right"
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		position.x -= 300 * delta
		$AnimatedSprite2D.animation = "walk_left"
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		position.y += 300 * delta
		$AnimatedSprite2D.animation = "walk_down"
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		position.y -= 300 * delta
		$AnimatedSprite2D.animation = "walk_up"

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
