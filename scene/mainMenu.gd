extends Node2D


func _ready():
	var dir = Directory.new()
	if dir.dir_exists('user://saveVisualNovel/'):
		$VBoxContainer/loadGame.disabled = false



func _on_startButton_pressed():
	get_tree().change_scene("res://scene/createChar/createChare.tscn")


func _on_exitButton_pressed():
	get_tree().quit()


func _on_loadGame_pressed():
	get_tree().change_scene("res://scene/episode select.tscn")
