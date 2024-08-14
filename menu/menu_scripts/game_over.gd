extends Node2D

func _on_stop_button_pressed():
	get_tree().quit(3)

func _on_speel_verder_button_pressed():
	var change_level :String = "res://levels/level_%d" % Global.huidig_level +".tscn"
	get_tree().change_scene_to_file(change_level)
