extends Node2D

func _on_stop_button_pressed():
	get_tree().quit(3)

func _on_speel_verder_button_pressed():
	get_tree().change_scene_to_file("res://level_1.tscn")
