extends Node2D

var player_in_area = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_in_area:
		#TODO: voeg game over systeem toe
		wait(3)
		get_tree().quit(3)

func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player_in_area = true

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
