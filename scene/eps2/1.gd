extends Node2D

onready var gameLoad = $loadGameStat
export(Script) var gameSaveClass



func resSaveData(person):
	var newSave = gameSaveClass.new()
	newSave.playerName = person.playerName
	newSave.gender = person.gender
	newSave.latestEpisode = 2
	
	var dir = Directory.new()
	if not dir.dir_exists('user://saveVisualNovel/'):
		dir.make_dir_recursive('user://saveVisualNovel/')
	ResourceSaver.save('user://saveVisualNovel/playerData.tres', newSave)

func _ready():
	#loadGameProperty(person)
	var person = gameLoad.resLoadGame()
	gameLoad.loadGameProperty(person)
	resSaveData(person)
	
	#dialog initiate
	if person['gender'] == 'female':
		var new_dialog = Dialogic.start('day2-part1F')
		add_child(new_dialog)
			
	if person['gender'] == 'male':
		var new_dialog = Dialogic.start('day2-part1M')
		add_child(new_dialog)
