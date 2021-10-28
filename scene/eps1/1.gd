extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const fileLocation = "res://gameData/playerStat.json"
onready var gameLoad = $loadGameStat
	
func _ready():
	#var person = loadGame(fileLocation)
	#loadGameProperty(person)
	var person = gameLoad.loadGame()
	gameLoad.loadGameProperty(person)
	#dialog initiate
	var new_dialog = Dialogic.start('test')
	add_child(new_dialog)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#print(dialog.isMale)
