extends Node2D

func _on_button_pressed():
	get_tree().change_scene_to_file("res://levels/level_scenes/level_1.tscn")

func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://menu/menu_scenes/controlles.tscn")
