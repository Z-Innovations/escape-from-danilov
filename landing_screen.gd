extends Control

#var main_scene = preload("res://main.tscn").instantiate()

func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
