extends Node2D


var tutorial = 0

func selector():
	if tutorial == 1:
		 $"1".visible = true
	elif tutorial == 2:
		$"2".visible = true
	elif tutorial == 3:
		$"3".visible = true
	elif tutorial == 4:
		get_tree().change_scene("res://scene/mini games/found.tscn")

func _process(delta):
	selector()
	if Input.is_action_just_pressed("klick"):
		tutorial += 1
