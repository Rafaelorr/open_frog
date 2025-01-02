extends CharacterBody2D

var state = "hit" # blink, hit, default
var can_hit = true
@onready var spike_head = $spike_head

func _process(delta):
	if state == "blink":
		can_hit = false
		spike_head.play("blink")
	if state == "hit":
		can_hit = true
		spike_head.play("hit")

func _on_area_2d_body_entered(body):
	if body is speler :
		spike_head.play("hit")
		wait(100.0)
		get_tree().change_scene_to_file("res://menu/menu_scenes/game_over.tscn")

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
