extends Node2D

var mouseOn = false
var canClick = true

func _ready():
	pass


func _on_Area2D_mouse_entered():
	mouseOn = true

func _input(event):
	if canClick and event.is_action_pressed("click") and mouseOn:
		Connections.add_connection(global_position)
