extends "res://scripts/trap.gd"

@export_range(0.5, 2.0, 0.2) var ball_speed: float = 1.0

@onready var anim_player = $AnimationPlayer

func _ready():
	anim_player.speed_scale = ball_speed
	
