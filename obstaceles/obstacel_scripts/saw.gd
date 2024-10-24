extends Node2D
var player_in_area :bool = false

func _on_area_2d_body_entered(body):
	if body is speler:
		get_tree().change_scene_to_file("res://menu/menu_scenes/game_over.tscn")
