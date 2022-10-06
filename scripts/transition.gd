extends CanvasLayer

onready var colorRect = $ColorRect
onready var anim = $AnimationPlayer

const LIGHT = "#fbf1c7"
const DARK = "#282828"
signal finished

func close():
	anim.play("fade in")
	yield(anim, "animation_finished")
	emit_signal("finished")

func enter():
	anim.play("fade out")
	yield(anim, "animation_finished")
	emit_signal("finished")

func change_color(new_color):
	new_color = DARK if new_color == "dark" else LIGHT
	colorRect.color = new_color
