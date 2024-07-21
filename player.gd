extends CharacterBody2D

const SPEED :float = 300.0
const JUMP_VELOCITY :float = -600.0
var double_jump :int = 0
@export var speler_aantal_munten = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

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

	move_and_slide()
	
	if $Sprite2D.global_position[1] > 3400.0:
		get_tree().change_scene_to_file("res://game_over.tscn")
	elif Input.is_action_just_pressed("stop"):
		get_tree().change_scene_to_file("res://game_over.tscn")

func player():
	pass
