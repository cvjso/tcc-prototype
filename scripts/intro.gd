extends Control


func _ready():
	pass

func _input(event):
	if event.is_action_pressed("click"):
		get_tree().change_scene("res://scenes/playtest.tscn")
