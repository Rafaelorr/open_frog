extends Node2D

func _on_area_2d_body_entered(body):
	if body is speler:
		body.slow_fall = true

func _on_area_2d_body_exited(body):
	if body is speler:
		body.slow_fall = false
