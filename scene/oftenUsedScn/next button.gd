extends CanvasLayer


var pressAble = true

onready var timer = $Timer
onready var button = $TouchScreenButton


func _ready():
	pass # Replace with function body.

func _process(_delta):
	if pressAble == true:
		button.visible = true
	elif pressAble == false:
		button.visible = false


func _on_TouchScreenButton_pressed():
	pressAble = false
	timer.start()


func _on_Timer_timeout():
	pressAble = true
