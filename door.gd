extends Area2D

var entered :bool = false
@export var connected_scene_file_path : String
@export var Open : bool = true
var scene_folder = "res://levels/"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if entered:
		if Open:
			var full_path = scene_folder + connected_scene_file_path + ".tscn"
			get_tree().change_scene_to_file(full_path)
		else:
			if Global.aantal_sleutels > 0:
				Open = true
				Global.aantal_sleutels -= 1

func _on_body_entered(body: CharacterBody2D):
	if body.has_method("player"):
		entered = true


func _on_body_exited(body):
	if body.has_method("player"):
		entered = false
