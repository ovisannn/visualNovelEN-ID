extends Node2D

onready var gameLoad = $loadGameStat

func _ready():
	
	#loadGameProperty(person)
	var person = gameLoad.loadGame()
	gameLoad.loadGameProperty(person)
	
	#dialog initiate
	if person['gender'] == 'female':
		var new_dialog = Dialogic.start('day4-part1F')
		add_child(new_dialog)
			
	if person['gender'] == 'male':
		var new_dialog = Dialogic.start('day4-part1M')
		add_child(new_dialog)
		
