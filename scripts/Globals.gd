extends Node

var connections = []
var mouse_selected = false
var node_start = null
var Transition = preload("res://scenes/transition.tscn")

func add_connection(nod):
	connections.append(nod)

func clean():
	mouse_selected = false
	node_start = null

func _input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()

func change_scene(new_scene:String, type:String):
	var transition = Transition.instance()
#	get_tree().current_scene.add_child(transition)
	add_child(transition)
	transition.change_color(type)
	transition.close()
	yield(transition, "finished")
	assert(get_tree().change_scene(new_scene) == OK)
	#get_tree().current_scene.pause_mode = true
#	transition = Transition.instance()
#	get_tree().current_scene.add_child(transition)
#	transition.change_color(type)
	transition.enter()
	yield(transition, "finished")
#	get_tree().current_scene.pause_mode = false
#	get_tree().current_scene.remove_child(transition)
	remove_child(transition)
