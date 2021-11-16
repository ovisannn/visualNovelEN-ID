extends Node2D


onready var gameLoad = $loadGameStat
	
func _ready():

	#loadGameProperty(person)
	var person = gameLoad.resLoadGame()
	print(person.playerName)
	gameLoad.loadGameProperty(person)
	
	#dialog initiate
	var new_dialog = Dialogic.start('day1-part1')
	add_child(new_dialog)

