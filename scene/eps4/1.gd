extends Node2D

onready var gameLoad = $loadGameStat
export(Script) var gameSaveClass



func resSaveData(person):
	var newSave = gameSaveClass.new()
	newSave.playerName = person.playerName
	newSave.gender = person.gender
	newSave.latestEpisode = 4
	
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
		var new_dialog = Dialogic.start('day4-part1F')
		new_dialog.connect("dialogic_signal", self, "dialog_listener")
		add_child(new_dialog)
			
	if person['gender'] == 'male':
		var new_dialog = Dialogic.start('day4-part1M')
		new_dialog.connect("dialogic_signal", self, "dialog_listener")
		add_child(new_dialog)
		
func dialog_listener(string):
	match string:
		"drone":
			$imgPop/drone.visible = true
		"giraffe":
			$imgPop/giraffe.visible = true
		"cheetah":
			$imgPop/cheetah.visible = true
		"rhino":
			$imgPop/rhino.visible = true
		"zebra":
			$imgPop/zebra.visible = true
		"close":
			$imgPop/drone.visible = false
			$imgPop/giraffe.visible = false
			$imgPop/cheetah.visible = false
			$imgPop/rhino.visible = false
			$imgPop/zebra.visible = false
		
