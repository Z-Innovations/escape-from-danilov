extends Control

var main_scene = preload("res://main.tscn").instantiate()

func _on_texture_button_pressed() -> void:
	get_tree().root.add_child(main_scene)
