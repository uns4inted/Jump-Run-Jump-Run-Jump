extends CharacterBody2D
class_name Player

@export var gravity = 400
@export var speed = 150
@export var jump_force = 200

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity * delta
		if velocity.y > 500:
			velocity.y = 500
		
	if Input.is_action_just_pressed("Jump") && is_on_floor():
		jump(jump_force)
	
	var direction = Input.get_axis("Move Left", "Move Right")
	
	if direction != 0:
		animated_sprite.flip_h = (direction == -1)
	
	velocity.x = direction * speed	
	move_and_slide()
	update_animations(direction)
	
func update_animations(direction):
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		if velocity.y < 0:
			animated_sprite.play("jump")
		else:
			animated_sprite.play("fall")


func jump(force):
	velocity.y = -force
