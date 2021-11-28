extends CanvasLayer

onready var menu = $Node2D
onready var pausebtn = $TextureButton


func _on_TextureButton_toggled(button_pressed):
	if button_pressed == true:
		menu.visible = true
	elif button_pressed == false:
		menu.visible = false


func _on_TextureButton2_pressed():
	pausebtn.pressed = false


func _on_TextureButton3_pressed():
	get_tree().change_scene("res://scene/mainMenu.tscn")
