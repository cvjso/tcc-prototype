tool
extends Node2D

onready var text = $RichTextLabel
onready var connection = $connection
export var input := ""
export var output := ""
export(Array, NodePath) var target = []
export var disabled := false


