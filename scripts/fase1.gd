extends Node2D

onready var tg1 = $tg1
onready var tg2 = $tg2
onready var tg3 = $tg3

export var next = ""

var done = 0
var success = preload("res://scenes/Sucess.tscn")

func _ready():
	tg1.connect("shown", self, "progress")
	tg2.connect("shown", self, "progress")
	tg3.connect("shown", self, "progress")
	var dialog = Dialogic.start("esteganografia")
	add_child(dialog)

func progress():
	done += 1
	if done == 3:
		var s = success.instance()
		s.next_scene = next
		add_child(s)
