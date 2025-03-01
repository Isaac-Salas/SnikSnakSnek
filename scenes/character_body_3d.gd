extends CharacterBody3D

@onready var ANIMATION: AnimatedSprite3D = $AnimatedSprite3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var running = false
var MOMENTUM = 0.1


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	print(running)
	if Input.is_action_pressed("RUN"):
		running = true
	else:
		running = false
		
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		match direction.x:
			1.0:
				ANIMATION.flip_h = false
			-1.0:
				ANIMATION.flip_h = true
		ANIMATION.play("run")
		
		if running ==  true:
			print(MOMENTUM)
			velocity.x = direction.x * (SPEED+MOMENTUM)
			#velocity.z = direction.z * (SPEED+MOMENTUM)
			if MOMENTUM < 10:
				MOMENTUM += 0.1
				
		else:
			if MOMENTUM > 0.1 :
				MOMENTUM -= 0.1
			velocity.x = direction.x * (SPEED+MOMENTUM)
			#velocity.z = direction.z * SPEED+MOMENTUM/2
			
	else:
		
		ANIMATION.play("default")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
