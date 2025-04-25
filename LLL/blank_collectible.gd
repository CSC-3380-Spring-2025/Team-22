extends StaticBody2D

@export var item: Item
var player: CharacterBody2D = null

func _on_interactable_area_body_entered(body: Node) -> void:
	if body.has_method("collect"):
		player = body as CharacterBody2D
		playercollect()
		await get_tree().create_timer(0.1).timeout
		queue_free()

func playercollect() -> void:
	if player:
		player.collect(item)
