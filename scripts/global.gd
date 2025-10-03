extends Node

var hardcore_mode = false
var difficulty = "normal"
var checkpoint = null
var checkpoints = []
var deaths = 0

func _ready() -> void:
	LimboConsole.add_argument_autocomplete_source("checkpoint", 0,
		func(): return checkpoints
	)
