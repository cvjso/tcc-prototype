extends Node

var connections = []
var mouse_selected = false
var node_start = null

func add_connection(nod):
	connections.append(nod)

func clean():
	mouse_selected = false
	node_start = null

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()
