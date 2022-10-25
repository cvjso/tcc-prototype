extends Node2D

export var target := ""

onready var lock = $lock

signal done

func _ready():
	lock.connect("changed_result", self, "check_is_correct")

func check_is_correct():
	if lock.get_cypher_result() == target:
		emit_signal("done")
