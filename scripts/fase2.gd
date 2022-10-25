extends Node2D

var done = 0
var success = preload("res://scenes/Sucess.tscn")

onready var cypher = $"simetric cypher"

func _ready():
	cypher.connect("done", self, "next_level")

func next_level():
	var s = success.instance()
	add_child(s)
