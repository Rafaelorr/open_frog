extends Node2D

var state = "no_munt" # no_munt, munt
var player_in_area = false

func _process(_delta):
	if state == "munt":
		if player_in_area:
			pass


func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player_in_area = true


func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
