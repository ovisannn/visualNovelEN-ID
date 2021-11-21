extends Node2D

onready var gameLoad = $loadGameStat

func _ready():
	
	#loadGameProperty(person)
	var person = gameLoad.resLoadGame()
	gameLoad.loadGameProperty(person)
	
	#dialog initiate
	if person['gender'] == 'female':
		var new_dialog = Dialogic.start('day1-part2F')
		new_dialog.connect("dialogic_signal", self, "dialog_listener")
		add_child(new_dialog)
			
	if person['gender'] == 'male':
		var new_dialog = Dialogic.start('day1-part2')
		new_dialog.connect("dialogic_signal", self, "dialog_listener")
		add_child(new_dialog)
		
func dialog_listener(string):
	match string:
		"drone":
			print(true)



