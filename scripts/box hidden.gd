extends Node2D

var mouse_on = false

onready var anim = $AnimationPlayer
onready var connection = $connection

export var text := ""
var done = false
signal shown

func _ready():
	connection.connect("made_connection", self, "show")
	$RichTextLabel.bbcode_text = "[center]" + text

func show():
	if !done:
		anim.play("start")
		done = true
		emit_signal("shown")
