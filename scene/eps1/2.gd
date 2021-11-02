extends Node2D

onready var gameLoad = $loadGameStat

func _ready():
	
	#loadGameProperty(person)
	var person = gameLoad.loadGame()
	gameLoad.loadGameProperty(person)
	
	#dialog initiate
	var new_dialog = Dialogic.start('day1-part2')
	add_child(new_dialog)

