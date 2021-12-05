extends Node2D


var slide = 1

func changeImage():
	if slide == 1:
		$"1".visible = true
	elif slide == 2:
		$"2".visible = true
	elif slide == 3:
		$"3".visible = true
	elif slide == 4:
		$"4".visible = true
	elif slide == 5:
		$"5".visible = true		
	elif slide == 6:
		$"6".visible = true		
	elif slide == 7:
		$"7".visible = true
	elif slide == 8:
		get_tree().change_scene("res://scene/mini games/grosseries.tscn")
		
func _ready():
	pass

func _process(delta):
	changeImage()
	if Input.is_action_just_pressed("klick"):
		slide+=1
