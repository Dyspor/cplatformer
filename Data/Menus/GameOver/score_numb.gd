extends Label


func _ready() -> void:
	$ScoreNumb.text = str(int(Global.points))
