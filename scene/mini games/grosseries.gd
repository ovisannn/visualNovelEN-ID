extends Node2D

export(Script) var gameSaveClass
var avocado = 5000
var cabbage = 3000
var lemon = 1000
var broccoli = 2500
var carrot = 2000

var totalAvocado = 0 
var totalCabbage = 0
var totalLemon = 0
var totalbroccoli = 0
var totalCarrot = 0

var totalPrice = 0

var score = 100

var temporalInput

func resSaveData():
	var savedData = load("user://saveVisualNovel/playerData.tres")
	var newSave = gameSaveClass.new()
	newSave.playerName = savedData.playerName
	newSave.gender = savedData.gender
	newSave.latestEpisode = savedData.latestEpisode
	newSave.scoreMinigames1 = savedData.scoreMinigames1
	newSave.scoreMinigames2 = score
	newSave.scoreMinigames3 = savedData.scoreMinigames3
	print(newSave.scoreMinigames1)
	print(newSave.scoreMinigames2)
	print(newSave.scoreMinigames3)
	var dir = Directory.new()
	if not dir.dir_exists('user://saveVisualNovel/'):
		dir.make_dir_recursive('user://saveVisualNovel/')
	ResourceSaver.save('user://saveVisualNovel/playerData.tres', newSave)

func _on_TextureButton_pressed():
	$priceList/pricelist.visible = false


func _on_Button_pressed():
	$priceList/pricelist.visible = true


func _on_avocadoEntri_text_changed(new_text):
	totalAvocado = int(new_text)


func _on_avocadoEntri_focus_exited():
	if totalAvocado!=avocado*5:
		$"groceries list/avocadoEntri".placeholder_text = 'Wrong answer, try again'
		$"groceries list/avocadoEntri".text = ''


func _on_cabbageEntri_text_changed(new_text):
	totalCabbage = int(new_text)


func _on_cabbageEntri_focus_exited():
	if totalCabbage != cabbage*3:
		$"groceries list/cabbageEntri".placeholder_text = 'Wrong answer, try again'
		$"groceries list/cabbageEntri".text = ''


func _on_lemonEntri_text_changed(new_text):
	totalLemon = int(new_text)


func _on_lemonEntri_focus_exited():
	if totalLemon != lemon*1:
		$"groceries list/lemonEntri".placeholder_text = 'Wrong answer, try again'
		$"groceries list/lemonEntri".text = ''


func _on_broccoliEntri_text_changed(new_text):
	totalbroccoli = int(new_text)


func _on_broccoliEntri_focus_exited():
	if totalbroccoli != broccoli*2:
		$"groceries list/broccoliEntri".placeholder_text = 'Wrong answer, try again'
		$"groceries list/broccoliEntri".text = ''


func _on_carrotEntri_text_changed(new_text):
	totalCarrot = int(new_text)


func _on_carrotEntri_focus_exited():
	if totalCarrot != carrot*9:
		$"groceries list/carrotEntri".placeholder_text = 'Wrong answer, try again'
		$"groceries list/carrotEntri".text = ''


func _on_LineEdit_text_changed(new_text):
	totalPrice = int(new_text)


func _on_calculate_pressed():
	if totalPrice == 0:
		if score >20:
			score -= 20
		$priceList/wrongNotif.visible = true
				
	elif totalPrice == totalAvocado+totalCabbage+totalCarrot+totalLemon+totalbroccoli:
		#procceed save func
		resSaveData()
		#procced into next scene
		get_tree().change_scene("res://scene/eps3/2.tscn")
	else:
		if score > 20:		#show wrong popup
			score -= 20
		$priceList/wrongNotif.visible = true


func _on_okey_pressed():
	$totalBoard/LineEdit.text = ''
	$priceList/wrongNotif.visible = false


func _on_avocadoEntri_focus_entered():
	pass


func _on_cabbageEntri_focus_entered():
	pass # Replace with function body.


func _on_lemonEntri_focus_entered():
	pass # Replace with function body.


func _on_broccoliEntri_focus_entered():
	pass # Replace with function body.


func _on_carrotEntri_focus_entered():
	pass # Replace with function body.


func _on_Entri_focus_entered():
	pass # Replace with function body.
