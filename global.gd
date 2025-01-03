extends Node

var aantal_sleutels :int = 0
var aantal_munten :int = 0
var huidig_level :int = 0
var level_tijden :Array[float] = [0.0,0.0,0.0,0.0,0.0,0.0]

func wait(seconds: float) -> void:
  await get_tree().create_timer(seconds).timeout
