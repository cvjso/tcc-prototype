extends CanvasLayer

var next_scene = ""

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("click"):
		if next_scene != "":
			get_tree().change_scene(next_scene)
		else:
			get_tree().quit()
