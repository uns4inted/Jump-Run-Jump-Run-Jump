extends Control


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level.tscn") ## TODO: load start menu when implemented
