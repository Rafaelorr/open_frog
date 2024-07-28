class_name speler
extends CharacterBody2D

@export var SPEED :float = 300.0
@export var JUMP_VELOCITY :float = -600.0
@export var slow_fall : bool = false
var double_jump :int = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
@export var gravity :float = 980.0

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
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if slow_fall:
		if velocity.y > 200.0:
			velocity.y = 200.0
	
	move_and_slide()
	
	if $Sprite2D.global_position[1] > 3400.0:
		get_tree().change_scene_to_file("res://game_over.tscn")
	elif Input.is_action_just_pressed("stop"):
		get_tree().quit(3)

func player():
	pass

func spring(power: float, direction: float) -> void:
	velocity.x = velocity.x - cos(direction) * power
	velocity.y = -sin(direction) * power
