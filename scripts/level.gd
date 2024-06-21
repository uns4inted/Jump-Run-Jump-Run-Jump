extends Node2D

@onready var start = $Start
@onready var player = $Player

func _ready():
	player.global_position = start.get_spawn_position()
	
	var traps = get_tree().get_nodes_in_group("traps")
	for trap in traps:
		#trap.connect("touched_player", _on_trap_touched_player) ## old syntax
		trap.touched_player.connect(_on_trap_touched_player) ## godot 4 syntax

func _process(delta):
	## KEYBINDS FOR TESTING PURPOSES
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit() 
	elif Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()


func _on_deathzone_body_entered(body):
	reset_player()

func _on_trap_touched_player():
	reset_player()
		
func reset_player():
	player.velocity = Vector2.ZERO
	player.global_position = start.get_spawn_position()
