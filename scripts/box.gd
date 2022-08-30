extends Node2D

export var Content := ""
onready var text = $RichTextLabel

func _ready():
	text.bbcode_text = Content

