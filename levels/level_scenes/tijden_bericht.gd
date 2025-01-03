extends Label

func _process(delta):
	while true:
		for i in range(1,7):
			text = "level_" + str(i) + ": " + GlobalTimer._format_seconds(Global.level_tijden[0],true)
			Global.wait(2)
