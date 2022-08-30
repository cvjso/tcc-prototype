extends Node2D

export(Array, Array, PackedScene) var nodes = []

# [ [bla, bla2] ]

func _ready():
	for i in nodes:
		if len(i) == 2:
			var newConnection = Line2D
