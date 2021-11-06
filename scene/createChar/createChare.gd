extends Node2D


const fileLocation = "res://gameData/playerStat.json"
onready var confirmator = $confirm
var ready = false

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
	print(123)
	if button_pressed == true:
		$maleButton.pressed = false
		charStat["gender"] = "female"
	else:
		charStat["gender"] = ""


func _on_yes_pressed():
	get_tree().change_scene("res://scene/eps1/1.tscn")


func _on_no_pressed():
	ready = false
