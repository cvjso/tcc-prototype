extends Node2D

var mouseOn = false
var canClick = true
var Verlet = preload("res://scenes/verlet.tscn")
var node_connected = null	# Ponteiro pro outro node
signal made_connection

func _ready():
	randomize()

func _on_Area2D_mouse_entered():
	if canClick and not mouseOn:
		mouseOn = true

func make_connection(end_position):
	var verlet = Verlet.instance()
	add_child(verlet)
	verlet.global_position = Vector2(0,0)
	verlet.set_start(global_position)
	verlet.set_last(end_position)
	Globals.clean()

func _input(event):
	if event.is_action_pressed("click") and mouseOn:
		if not Globals.mouse_selected:
			Globals.mouse_selected = true
			Globals.node_start = self
		elif Globals.node_start != self:
			node_connected = Globals.node_start
			Globals.node_start.make_connection(global_position)
			emit_signal("made_connection")

func _on_Area2D_mouse_exited():
	if canClick and mouseOn:
		mouseOn = false
