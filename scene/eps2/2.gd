extends Node2D

onready var gameLoad = $loadGameStat


func _ready():
	
	#loadGameProperty(person)
	var person = gameLoad.resLoadGame()
	gameLoad.loadGameProperty(person)

	if person['gender'] == 'female':
		var new_dialog = Dialogic.start('day2-part2F')
		new_dialog.connect("dialogic_signal", self, "dialog_listener")
		add_child(new_dialog)
			
	if person['gender'] == 'male':
		var new_dialog = Dialogic.start('day2-part2M')
		new_dialog.connect("dialogic_signal", self, "dialog_listener")
		add_child(new_dialog)
		
func dialog_listener(string):
	match string:
		"tabletPhone":
			$imgPop/tabletPhone.visible = true
		"smartPhone":
			$imgPop/smartPhone.visible = true
		"ps5":
			$imgPop/ps5.visible = true
		"vrHeadset":
			$imgPop/vrHeadset.visible = true
		"close":
			$imgPop/tabletPhone.visible = false
			$imgPop/smartPhone.visible = false
			$imgPop/ps5.visible = false
			$imgPop/vrHeadset.visible = false

