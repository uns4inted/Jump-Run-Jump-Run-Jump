extends Node2D

@export var next_level: PackedScene = null
@export var level_time = 5

@onready var start = $Start
@onready var exit = $Exit
@onready var player = $Player
@onready var deathzone = $Deathzone

var timer_node = null
var time_left
var level_completed = false

func _ready():
	player.global_position = start.get_spawn_position()
	
	var traps = get_tree().get_nodes_in_group("traps")
	for trap in traps:
		#trap.connect("touched_player", _on_trap_touched_player) ## old syntax
		trap.touched_player.connect(_on_trap_touched_player) ## godot 4 syntax
	
	exit.body_entered.connect(_on_exit_body_entered)
	deathzone.body_entered.connect(_on_deathzone_body_entered)
	
	setup_level_timer()


func _process(delta):
	## KEYBINDS FOR TESTING PURPOSES
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit() 
	elif Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()


func setup_level_timer():
	time_left = level_time
	timer_node = Timer.new()
	timer_node.name = "Level Timer"
	timer_node.wait_time = 1
	timer_node.timeout.connect(_on_level_timer_timeout)
	
	add_child(timer_node)
	timer_node.start()
	

func _on_level_timer_timeout():
	print(time_left)
	if level_completed:
		timer_node.stop()
	else:
		time_left -= 1
		if time_left < 0:
			get_tree().reload_current_scene()
	

func _on_deathzone_body_entered(body):
	reset_player()
	

func _on_trap_touched_player():
	reset_player()
	

func reset_player():
	player.velocity = Vector2.ZERO
	player.global_position = start.get_spawn_position()
	

func _on_exit_body_entered(body):
	if body is Player:
		if next_level != null:
			exit.animate()
			player.deactivate()
			level_completed = true
			await get_tree().create_timer(2).timeout
			get_tree().change_scene_to_packed(next_level)
	
