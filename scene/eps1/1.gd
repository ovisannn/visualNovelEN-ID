extends Node2D


onready var gameLoad = $loadGameStat

var showTranslate = false

func _ready():

	#loadGameProperty(person)
	var person = gameLoad.resLoadGame()
	gameLoad.loadGameProperty(person)
	
	#dialog initiate
	var new_dialog = Dialogic.start('day1-part1')
	add_child(new_dialog)
	
func _process(_delta):
	if Input.is_action_just_pressed("ui_down") and showTranslate == false:
		showTranslate = true
		Input.warp_mouse_position(Vector2(350, 560))
		
	elif Input.is_action_just_pressed("ui_down") and showTranslate == true:
		showTranslate = false
		Input.warp_mouse_position(Vector2(0, 0))

