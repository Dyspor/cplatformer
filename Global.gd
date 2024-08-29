extends Node

var points: float = 0.0

func _ready():
	get_viewport().size = DisplayServer.screen_get_size()
