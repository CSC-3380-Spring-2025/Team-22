extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_tutorial_button_pressed() -> void:
	var canvas_layer = get_node("MarginContainer2/Panel") # Replace "CanvasLayer" with the actual name of your CanvasLayer
	canvas_layer.set_visible(not canvas_layer.is_visible())
