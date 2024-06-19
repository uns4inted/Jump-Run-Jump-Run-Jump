extends Node2D

@onready var start_position = $StartPosition

func _process(delta):
	## KEYBINDS FOR TESTING PURPOSES
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit() 
	elif Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()


func _on_deathzone_body_entered(body):
	print("player falls off the ground")
	body.velocity = Vector2.ZERO
	body.global_position = start_position.global_position
