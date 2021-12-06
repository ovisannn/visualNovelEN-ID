extends Node2D

onready var gameLoad = $loadGameStat
export(Script) var gameSaveClass


func resSaveData(person):
	var newSave = gameSaveClass.new()
	newSave.playerName = person.playerName
	newSave.gender = person.gender
	newSave.scoreMinigames1 = person.scoreMinigames1
	newSave.scoreMinigames2 = person.scoreMinigames2
	newSave.scoreMinigames3 = person.scoreMinigames3
	if person.latestEpisode >= 3 :
		newSave.latestEpisode = person.latestEpisode
	else:
		newSave.latestEpisode = 3
	
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
		var new_dialog = Dialogic.start('day3-part1F')
		add_child(new_dialog)
			
	if person['gender'] == 'male':
		var new_dialog = Dialogic.start('day3-part1M')
		add_child(new_dialog)
		

