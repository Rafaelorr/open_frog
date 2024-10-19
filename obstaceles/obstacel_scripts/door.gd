extends Area2D

var entered :bool = false
@export var connected_scene_file_path : String
@export var Open : bool = true
var scene_folder = "res://levels/level_scenes/"

func _process(_delta):
	if entered and Open:
        var full_path :String = scene_folder + connected_scene_file_path + ".tscn"
		get_tree().change_scene_to_file(full_path)
		ResourceLoader.load(full_path, "PackedScene", ResourceLoader.CACHE_MODE_REUSE)
	elif entered and Global.aantal_sleutels > 0:
		Open = true
		Global.aantal_sleutels -= 1

func _on_body_entered(body: CharacterBody2D):
	if body is speler:
		entered = true


func _on_body_exited(body):
	if body is speler:
		entered = false