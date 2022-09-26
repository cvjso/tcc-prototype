tool
extends Node2D

onready var text = $RichTextLabel
onready var connection = $connection
export var input := ""
export var output := ""
export(Array, NodePath) var target = []
export var disabled := false

func _ready():
	randomize()
	text.bbcode_text = "[center]" + input
	connection.canClick = !disabled
	if target != []:
		var cl = randi() % 6
		var prev = self
		for tg_path in target:
			var tg = get_node(tg_path)
			prev.get_node("connection").make_connection(tg.global_position, cl)
			prev = tg

