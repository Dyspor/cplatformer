extends Node2D

# This function handles the key input, changing the scene if "Jump" is pressed
func _unhandled_key_input(event):
	if Input.is_action_just_pressed("Jump"):
		get_tree().change_scene("res://game.tscn")

# This function is called when the scene is ready
func _ready() -> void:
	# Access nodes
	var score_label = $ScoreNumb
	var button = $TouchScreenButton

	# Update the score label text
	if score_label:
		score_label.text = str(int(Global.points)) + " m"
	else:
		print("ScoreNumb label not found")

# This function is called when the TouchScreenButton is pressed
func _on_touch_screen_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")
	
