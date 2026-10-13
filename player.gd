extends CharacterBody2D


const SPEED = 1000.0
const JUMP_VELOCITY = -900.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if NewAutoloadScript.playeralive:
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()
		
		#Animation
		if direction < 0:
			animated_sprite_2d.flip_h = true
			if is_on_floor():
				animated_sprite_2d.play("Run")
			else:
				animated_sprite_2d.play("Jump")
		elif direction == 0:
			if is_on_floor():
				animated_sprite_2d.play("Idle")
			else:
				animated_sprite_2d.play("Jump")
		else:
			animated_sprite_2d.flip_h = false
			if is_on_floor():
				animated_sprite_2d.play("Run")
			else:
				animated_sprite_2d.play("Jump")
				
	else:
		animated_sprite_2d.play("Die")
