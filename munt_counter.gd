extends Node2D

func _process(_delta):
	$Label.text = "munten: " + str(Global.aantal_munten)
