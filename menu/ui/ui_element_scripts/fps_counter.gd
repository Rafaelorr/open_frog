extends CanvasLayer

func _process(delta):
	$Label.text = "Fps: %d" % Engine.get_frames_per_second()
