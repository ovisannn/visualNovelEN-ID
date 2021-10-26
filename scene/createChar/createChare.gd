extends Node2D


var charaGender = "male"
var charaName = ""

func saveData():
	print(charaName)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_createButton_pressed():
	
	saveData()


func _on_charaNameText_text_changed(new_text):
	charaName = new_text
