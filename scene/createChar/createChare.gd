extends Node2D


const fileLocation = "res://gameData/playerStat.txt"
onready var confirmator = $confirm
var ready = false
export(Script) var gameSaveClass

export var charStat = {
	"name" : "",
	"gender":"",
	"episode": 1,
}


func resSaveData():
	var newSave = gameSaveClass.new()
	newSave.playerName = charStat['name']
	newSave.gender = charStat['gender']
	newSave.latestEpisode = charStat['episode']
	newSave.scoreMinigames1 = 0
	newSave.scoreMinigames2 = 0
	newSave.scoreMinigames3 = 0
	
	var dir = Directory.new()
	if not dir.dir_exists('user://saveVisualNovel/'):
		dir.make_dir_recursive('user://saveVisualNovel/')
	ResourceSaver.save('user://saveVisualNovel/playerData.tres', newSave)
	
	ready = true
	

func saveData():
	#print(charStat)
	var file = File.new()
	file.open(fileLocation, File.WRITE)
	file.store_string(to_json(charStat))
	file.close()
	ready = true
	


func _ready():
	pass


func _process(_delta):
	if ready == false:
		confirmator.visible = false
		$confirm/yes.disabled = true
		$confirm/no.disabled = true
	if ready == true:
		confirmator.visible = true
		$confirm/yes.disabled = false
		$confirm/no.disabled = false
	if charStat['gender'] =='' or charStat['name'] == '':
		$createButton.disabled = true
	else:
		$createButton.disabled = false
				


func _on_createButton_pressed():
	#saveData()
	resSaveData()

		


func _on_charaNameText_text_changed(new_text):
	charStat["name"] = new_text


func _on_maleButton_toggled(button_pressed):
	#$femaleButton.disabled = false
	#$maleButton.disabled = true
	if button_pressed == true:
		$femaleButton.pressed = false
		charStat["gender"] = "male"
	else:
		charStat["gender"] = ""
	

func _on_femaleButton_toggled(button_pressed):
	#$maleButton.disabled = false
	#$femaleButton.disabled = true
	if button_pressed == true:
		$maleButton.pressed = false
		charStat["gender"] = "female"
	else:
		charStat["gender"] = ""


func _on_yes_pressed():
	get_tree().change_scene("res://scene/episode select.tscn")


func _on_no_pressed():
	ready = false
