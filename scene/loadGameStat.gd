extends Node2D


const fileLocation = "res://gameData/playerStat.txt"

export(Script) var gameSaveClass

func loadGame():
	var file = File.new()
	file.open(fileLocation, file.READ)
	var text = file.get_as_text()
	#var data = parse_json(text)
	var data = JSON.parse(text)
	file.close()
	return data.result


func resLoadGame():
	var savedData = load("user://saveVisualNovel/playerData.tres")
	return savedData

func loadGameProperty(data):
	Dialogic.set_variable("name", data.playerName)
	if data.gender == "male":
		Dialogic.set_variable('isMale', 1)
	elif data.gender == 'female':
		Dialogic.set_variable('isMale', 0)
		
func _ready():
	pass
