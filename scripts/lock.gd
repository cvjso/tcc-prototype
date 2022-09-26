extends Node2D

export(String, "RSA", "CESAR", "VIGENERE") var Algo
export (Array, NodePath) var inputs

onready var connection = $connection

func _ready():
	randomize()
	if inputs.size() > 0:
		var cl = randi() % 6
		var prev = self
		for target in inputs:
			var tg = get_node(target)
			prev.get_node("connection").make_connection(tg.global_position, cl)
			prev = tg
