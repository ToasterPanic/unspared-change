extends Node2D



func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	# pass # Replace with function body.


func _on_play_hardcore_pressed() -> void:
	global.hardcore_mode = true
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	pass # Replace with function body.


func _on_siege_pressed() -> void:
	OS.shell_open("https://siege.hackclub.com")
