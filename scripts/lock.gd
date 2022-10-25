extends Node2D

export(String, "RSA", "CESAR", "VIGENERE") var Algo
export (Array, NodePath) var inputs
var alpha = 'abcdefghijklmnopqrstuvwxyz'

onready var connection = $connection
var key = null
var income = null
var outcome = null
# O 2° input deve ficar a chave

signal changed_result

func _ready():
	for target in inputs:
		var tg = get_node(target)
		connection.make_connection(tg.global_position)
	key = get_node(inputs[1])
	income = get_node(inputs[0])
	outcome = get_node(inputs[2])
	key.connect("key_changed", self, "update_values")


func cifra_cesar(value, key):
	var old_pos = alpha.find(value.to_lower())
	var n_pos = old_pos + key % 26
	return alpha.substr(n_pos, 1).to_upper()

func get_cypher_result():
	return outcome.get_text()

func update_values():
	if key.secret != "":
		outcome.change_text(cifra_cesar(income.input, int(key.secret)))
		emit_signal("changed_result")
	else:
		outcome.change_text("")
