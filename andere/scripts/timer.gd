extends Label

var time_elapsed := 0.0

func _format_seconds(time : float, use_milliseconds : bool) -> String:
	var minutes := time / 60
	var seconds := fmod(time, 60)

	if not use_milliseconds:
		return "%02d:%02d" % [minutes, seconds]

	var milliseconds := fmod(time, 1) * 100

	return "%02d:%02d:%02d" % [minutes, seconds, milliseconds]

func _process(delta: float) -> void:

	time_elapsed += delta
	text = _format_seconds(time_elapsed, true)

func _save_time():
	Global.level_tijden[Global.huidig_level - 1] = time_elapsed
	time_elapsed = 0
