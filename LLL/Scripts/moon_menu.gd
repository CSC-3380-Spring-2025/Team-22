extends Sprite2D

@export var speed = 2
@export var moveDistance = 4
@export var tolerance = 1

@onready var startX = position.x  # Correct the reference to position.x
@onready var startY = position.y  # Correct the reference to position.y

@onready var targetX = startX + moveDistance
@onready var targetY = startY + moveDistance

func _ready():
	set_process(true)

func _process(delta):
	_floating(delta)
	
# Handle the floating logic (both horizontal and vertical movement)
func _floating(delta):
	_processUp(delta)
	_processDown(delta)
	
# Move vertically (up/down)
func _processUp(delta):
	position.y = move_to_y(position.y, targetY, speed * delta)
	
	if abs(position.y - targetY) < tolerance:
		targetY = startY if targetY == startY + moveDistance else startY + moveDistance

# Move horizontally (left/right)
func _processDown(delta):
	position.x = move_to_x(position.x, targetX, speed * delta)
	
	if abs(position.x - targetX) < tolerance:
		targetX = startX if targetX == startX + moveDistance else startX + moveDistance

# Function to move vertically towards a target position
func move_to_y(currentPos, newPos, steps):
	var newPosActual = currentPos 
	
	# If the current position is less than the target, move up
	if newPosActual < newPos:
		newPosActual += steps
		if newPosActual > newPos:
			newPosActual = newPos
	
	# If the current position is greater than the target, move down
	else:
		newPosActual -= steps
		if newPosActual < newPos:
			newPosActual = newPos
	
	return newPosActual

# Function to move horizontally towards a target position
func move_to_x(currentPos, newPos, steps):
	var newPosActual = currentPos 
	
	# If the current position is less than the target, move right
	if newPosActual < newPos:
		newPosActual += steps
		if newPosActual > newPos:
			newPosActual = newPos  
	
	# If the current position is greater than the target, move left
	else:
		newPosActual -= steps
		if newPosActual < newPos:
			newPosActual = newPos  
	
	return newPosActual
