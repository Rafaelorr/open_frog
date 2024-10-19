class_name speler
extends CharacterBody2D

@export var SPEED :float = 300.0
@export var JUMP_VELOCITY :float = -600.0
@export var slow_fall : bool = false

var double_jump :int = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
@export var gravity :float = 980.0

var state :String = "fall" # states: idle run jump fall
var preVelocity :Vector2 = Vector2.ZERO

func _physics_process(delta):
	if velocity.x > 0:
		$Sprite2D.flip_h = false
	elif velocity.x < 0:
		$Sprite2D.flip_h = true

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

	var direction = Input.get_axis("links", "rechts")
	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0:
			state = "run"
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0:
			state = "run"
	
	if slow_fall and velocity.y > 200.0:
		velocity.y = 200.0
	
	if velocity.y < 0:
		state = "jump"
	
	if velocity.y > 0:
		state = "fall"
	
	#if state == "fall" and velocity.y < 20:
		#var scene = preload("res://particel_test.tscn")
		#var instance = scene.instantiate()
		#add_child(instance)
	
	if velocity.x == 0 and velocity.y == 0:
		state = "idle"

	animation_handler(state)

	move_and_slide()

	if Input.is_action_just_pressed("stop"):
		get_tree().quit(3)
	
	preVelocity = velocity

func animation_handler(state:String) -> void:
	if state == "idle":
		$Sprite2D.play("idle")
	elif state == "run":
		$Sprite2D.play("run")
	elif state == "jump":
		$Sprite2D.play("run")
	elif state == "fall":
		$Sprite2D.play("fall")

func spring(power: float, direction: float) -> void:
	velocity.x = velocity.x - cos(direction) * power
	velocity.y = -sin(direction) * power
