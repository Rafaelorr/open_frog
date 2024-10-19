extends Area2D

func _on_body_entered(body):
	if body is speler and not verzameld:
		Global.aantal_sleutels += 1
		queue_free()
