class_name speler
extends CharacterBody2D

@export var SPEED :float = 300.0
@export var JUMP_VELOCITY :float = -600.0
@export var slow_fall : bool = false
var double_jump :int = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
@export var gravity :float = 980.0

var state :String = "idle" # states: idle run jump fall

func _physics_process(delta):
	
	if velocity.x > 0:
		$Sprite2D.flip_h = false
	elif velocity.x < 0:
		$Sprite2D.flip_h = true
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if is_on_floor():
		double_jump = 1
	
	# Handle jump.
	if Input.is_action_just_pressed("omhoog") and is_on_floor() or Input.is_action_just_pressed("omhoog") and double_jump == 1 :
		if is_on_floor():
			double_jump = 1
			velocity.y = JUMP_VELOCITY
		elif double_jump == 1:
			double_jump = 0
			velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0:
			state = "run"
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0:
			state = "run"
	
	if slow_fall:
		if velocity.y > 200.0:
			velocity.y = 200.0
	
	if velocity.y < 0:
		state = "jump"
	
	if velocity.y > 0:
		state = "fall"
	
	if velocity.x == 0 and velocity.y == 0:
		state = "idle"
	
	print(state)
	
	animation_handler(state)
	
	move_and_slide()
	
	if $Sprite2D.global_position[1] > 3400.0:
		get_tree().change_scene_to_file("res://game_over.tscn")
	elif Input.is_action_just_pressed("stop"):
		get_tree().quit(3)

func animation_handler(state):
	if state == "idle":
		$Sprite2D.play("idle")
	elif state == "run":
		$Sprite2D.play("run")
	elif state == "jump":
		$Sprite2D.play("run")
	elif state == "fall":
		$Sprite2D.play("fall")

func player():
	pass

func spring(power: float, direction: float) -> void:
	velocity.x = velocity.x - cos(direction) * power
	velocity.y = -sin(direction) * power
