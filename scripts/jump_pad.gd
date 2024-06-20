extends Area2D

@export var jump_pad_force = 300

@onready var animated_sprite = $AnimatedSprite2D

func _on_body_entered(body):
	if body is Player:
		## activate only if player is falling on jump pad from top
		if body.velocity.y > 0: 
			animated_sprite.play("jump")
			body.jump(jump_pad_force) 
