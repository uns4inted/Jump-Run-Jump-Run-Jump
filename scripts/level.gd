extends Node2D

func _process(delta):
	## KEYBINDS FOR TESTING PURPOSES
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit() 
	elif Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()
