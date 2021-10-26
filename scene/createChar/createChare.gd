extends Node2D


const fileLocation = "res://gameData/playerStat.json"

export var charStat = {
	"name" : "",
	"gender":"",
	"episode": 0,
}


func saveData():
	#print(charStat)
	var file = File.new()
	file.open(fileLocation, File.WRITE)
	file.store_string(to_json(charStat))
	file.close()


func _ready():
	pass


#func _process(delta):
#	pass


func _on_createButton_pressed():
	saveData()


func _on_charaNameText_text_changed(new_text):
	charStat["name"] = new_text


func _on_maleButton_toggled(button_pressed):
	if button_pressed == true:
		$femaleButton.pressed = false
		charStat["gender"] = "male"
	else:
		charStat["gender"] = ""
	

func _on_femaleButton_toggled(button_pressed):
	if button_pressed == true:
		$maleButton.pressed = false
		charStat["gender"] = "female"
	else:
		charStat["gender"] = ""
