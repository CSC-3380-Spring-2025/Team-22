extends Sprite2D

#Position and speed controls
@export var speed = 10
@export var moveDistance = 50
@onready var startX = position.x 
@onready var targetX = position.x + moveDistance

#Rotation controls
@export var rotation_speed_degrees = 1
@export var min_rotation = 0
@export var max_rotation = 20
var current_rotation = 0
var rotation_complete = false
	

func _process(delta):
	#Rotation controls
	var rotation_step = deg_to_rad(rotation_speed_degrees) * delta
	current_rotation += rotation_step
	current_rotation = clamp(current_rotation, deg_to_rad(min_rotation), deg_to_rad(max_rotation))
	rotation = current_rotation
	
	if abs(current_rotation - deg_to_rad(max_rotation)) and !rotation_complete:
		rotation_complete = true
		reverse_movement()
	
	
	#Movement controls
	position.x = move_to_x(position.x, targetX, speed*delta)
	
	if abs(position.x - targetX) == targetX:
		if targetX == startX:
			targetX = position.x + moveDistance
		else:
			targetX = startX

func move_to_x(currentPos, newPos, steps):
	var new = currentPos
	
	if new < newPos:
		new += steps
		
		if new > newPos:
			new = newPos
			
	else: 
		new -= steps
		if new < newPos:
			new = newPos
	return new
		
func reverse_movement():
	if targetX == startX:
		targetX = position.x + moveDistance
	else:
		targetX = startX
		
		
		
