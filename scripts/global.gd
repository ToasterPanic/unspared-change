extends Node

var hardcore_mode = false
var checkpoint = null
var checkpoints = []

func _ready() -> void:
	LimboConsole.add_argument_autocomplete_source("checkpoint", 0,
		func(): return checkpoints
	)
