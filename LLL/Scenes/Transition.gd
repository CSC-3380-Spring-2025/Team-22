extends CanvasLayer

var next_scene: String

func start_transition(to_scene: String):
	next_scene = to_scene
	$AnimationPlayer.play("fade_out_in")

func change_scene_now():
	get_tree().change_scene_to_file(next_scene)
