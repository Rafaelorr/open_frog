extends Node2D

var player_in_area = false

func _process(_delta):
	if player_in_area:
		wait(3)
		get_tree().change_scene_to_file("res://game_over.tscn")

func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player_in_area = true

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
