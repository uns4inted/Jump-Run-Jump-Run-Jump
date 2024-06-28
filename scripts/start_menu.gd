extends Node2D

@export var first_level: PackedScene
## TODO: BEFORE MAKING RELEASE BUILD - SET THIS SCENE AS MAIN IN PROJECT SETTINGS

func _on_start_button_pressed():
	get_tree().change_scene_to_packed(first_level)


func _on_quit_button_pressed():
	get_tree().quit()
