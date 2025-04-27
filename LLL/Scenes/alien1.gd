extends StaticBody2D

const BATTLE := "res://Scenes/Battle.tscn"
var battle : AudioStreamPlayer

func _ready() -> void:
	#$Sprite2D.z_index = 100
	#battle = $battle
	pass

# This function is called when the player enters the area
#func _on_area_2d_area_entered(area: Area2D) -> void:
	#_start_battle()

# Goes to battle scene
#func _start_battle() -> void:
	#await get_tree().create_timer(1.0).timeout
	#get_tree().change_scene_to_file(BATTLE)
	
	# Play the battle music or sound after transitioning
	#battle.volume_db = -20
	#battle.play()
