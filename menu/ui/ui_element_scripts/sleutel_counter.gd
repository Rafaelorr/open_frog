extends CanvasLayer

func _process(_delta):
	$Label.text = "sleutels : " + str(Global.aantal_sleutels)
