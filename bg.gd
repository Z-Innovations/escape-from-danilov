extends Area2D

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		get_tree().reload_current_scene()
