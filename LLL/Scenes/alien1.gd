extends Area2D

@export var speed = 70
@export var moveDistance = 10

@onready var startX = position.x 

@onready var targetX = position.x + moveDistance

@onready var level = 0

@onready var NPExp = 0

func _process(delta: float)-> void:
	position.x = move_to_x(position.x, targetX, speed*delta)
	
	if position.x == targetX:
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
		
		

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Laika":
		get_tree().change_scene_to_file("res://Scenes/battle_stage.tscn")
	
	pass # Replace with function body.

func expLevels(expPts: int)-> void:
	NPExp += expPts
	if(NPExp % 10 == 0):
		level += 1
		#levels can be used to increase speed or other values 
