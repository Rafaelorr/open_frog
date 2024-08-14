extends Node2D

var verzameld = false
var player_in_area = false

func _process(_delta):
	if not verzameld:
		if player_in_area:
			verzameld = true
			Global.aantal_munten += 1
			print(Global.aantal_munten)
			queue_free()


func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player_in_area = true


func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
