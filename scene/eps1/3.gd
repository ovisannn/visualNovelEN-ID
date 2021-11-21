extends Node2D

onready var gameLoad = $loadGameStat

func _ready():
	print('loaded')
	#loadGameProperty(person)
	var person = gameLoad.resLoadGame()
	gameLoad.loadGameProperty(person)
	
	#dialog initiate
	if person['gender'] == 'female':
		var new_dialog = Dialogic.start('day1-part3F')
		add_child(new_dialog)
			
	if person['gender'] == 'male':
		var new_dialog = Dialogic.start('day1-part3M')
		add_child(new_dialog)
