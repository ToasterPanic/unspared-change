extends Node2D


func _process(delta: float) -> void:
	var size = get_viewport().get_visible_rect().size
	$CanvasLayer/Control.custom_minimum_size = size

func _on_play_easy_pressed() -> void:
	global.difficulty = "easy"
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_play_pressed() -> void:
	global.difficulty = "normal"
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_play_hardcore_pressed() -> void:
	global.difficulty = "hardcore"
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_siege_pressed() -> void:
	OS.shell_open("https://siege.hackclub.com")

func _set_menu(name: String):
	for n in $CanvasLayer/Control.get_children():
		if n.get_class() == "Panel":
			if n.get_name() == name:
				n.visible = true
			else:
				n.visible = false

func _on_play_menu_button() -> void:
	_set_menu("PlayMenu")


func _on_close_menu_pressed() -> void:
	_set_menu("OIJGSDGNUGDSUSN>Klgjli;byar3f8.hpyra933w;[]i214ybhul8,h7sdutxmfxuiy9s hvp8re9mpai,sd.oofjfp9,xo;i.fc")


func _on_credits_pressed() -> void:
	_set_menu("ExtrasCredits")
