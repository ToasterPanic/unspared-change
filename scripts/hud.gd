extends Control

@onready var player = get_parent().get_parent().get_node("Player")

@onready var bottom = get_parent().get_parent().get_node("Bottom").position.y

@onready var top = get_parent().get_parent().get_node("Top").position.y

func _process(delta: float) -> void:
	var percent = (player.position.y - bottom) / (top - bottom)
	print(percent)
	$ProgressBar.value = percent * 100
