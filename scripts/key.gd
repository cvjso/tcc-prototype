extends Node2D

var secret := ""

onready var anim = $AnimationPlayer
onready var label = $Label

var mouse_on = false
var shown = false

signal key_changed

func _ready():
	pass

func _on_Area2D_mouse_entered():
	mouse_on = true

func _on_Area2D_mouse_exited():
	mouse_on = false

func _input(event):
	if event.is_action_pressed("click") and mouse_on and !shown:
		anim.play("show up")
		shown = true
		label.grab_focus()
	elif event.is_action_pressed("click") and shown:
		anim.play_backwards("show up")
		shown = false

func _on_Label_text_changed(new_text:String):
	if len(new_text) <= 3 and (new_text.is_valid_integer() or new_text == ""):
		secret = new_text
		emit_signal("key_changed")
	else:
		label.text = ""
