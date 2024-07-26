extends Area2D

var verzameld = false

func _on_body_entered(body):
	if body.has_method("player") and not verzameld:
		verzameld = true
		Global.aantal_sleutels += 1
		queue_free()
