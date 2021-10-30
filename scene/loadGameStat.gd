extends Node2D


const fileLocation = "res://gameData/playerStat.json"

func loadGame():
	var file = File.new()
	file.open(fileLocation, file.READ)
	var text = file.get_as_text()
	var data = parse_json(text)
	return data

func loadGameProperty(data):
	Dialogic.set_variable("name", data['name'])
	if data['gender'] == "male":
		Dialogic.set_variable('isMale', 1)
	elif data['gender'] == 'female':
		Dialogic.set_variable('isMale', 0)
		
func _ready():
	pass
