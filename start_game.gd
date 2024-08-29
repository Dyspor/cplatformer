extends Control


func _unhandled_key_input(event):
	if event.is_pressed():
		get_tree().change_scene_to_file("res://game.tscn")

func _ready() -> void:
	# Ensure the node exists and then update its text
	var score_label = $ScoreNumb
	if score_label:
		score_label.text = str(int(Global.points))
	else:
		print("ScoreNumb label not found")
