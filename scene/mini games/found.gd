extends Node2D


export(Script) var gameSaveClass

onready var showHint = $"hint/AnimationPlayer"
onready var caos = $buttonCaos/caosAni
onready var piring = $buttonPiring/piringAni
onready var sendok = $buttonSendok/sendokAni
onready var gula = $buttonSugar/sugarAni
onready var kecap = $buttonKecap/kecapAni
onready var garpu = $buttonGarpu/garpuAni
onready var mainAni = $AnimationPlayer
onready var knifeAni = $buttonKnife/pisauAni
onready var timer = $gameTimer
var itemFound = 0
var score

func resSaveData():
	var savedData = load("user://saveVisualNovel/playerData.tres")
	var newSave = gameSaveClass.new()
	newSave.playerName = savedData.playerName
	newSave.gender = savedData.gender
	newSave.latestEpisode = savedData.latestEpisode
	newSave.scoreMinigames1 = score
	newSave.scoreMinigames2 = savedData.scoreMinigames2
	newSave.scoreMinigames3 = savedData.scoreMinigames3
	print(newSave.scoreMinigames1)
	var dir = Directory.new()
	if not dir.dir_exists('user://saveVisualNovel/'):
		dir.make_dir_recursive('user://saveVisualNovel/')
	ResourceSaver.save('user://saveVisualNovel/playerData.tres', newSave)

func pressed():
	print('button pressed')

func _ready():
	mainAni.play("intro")
	showHint.play("show")
	
func _process(_delta):
	if itemFound == 7 :
		var i = timer.get_time_left()
		if i > 60:
			score = 7
		elif i <= 60 and i > 30:
			score = 6
		elif i <= 30 and i > 0:
			score = 3
		#save method here ()
		resSaveData()
		get_tree().change_scene("res://scene/eps2/2.tscn")


func _on_buttonKecap_pressed():
	$buttonKecap/Kecap.z_index = 10
	kecap.play("true")


func _on_buttonGarpu_pressed():
	$buttonGarpu/Garpu.z_index = 10
	garpu.play("true")


func _on_buttonSugar_pressed():
	$buttonSugar/Sugar.z_index = 10
	gula.play("true")


func _on_buttonSendok_pressed():
	$buttonSendok/Sendok.z_index = 10
	sendok.play("true")


func _on_buttonPiring_pressed():
	$buttonPiring/Piring.z_index = 10
	piring.play("true")


func _on_buttonCaos_pressed():
	$buttonCaos/Caos.z_index = 10
	caos.play('true')


func _on_TextureButton_pressed():
	showHint.play("exit")
	$hint/BoardLong.visible = true



func _on_kecapAni_animation_finished(anim_name):
	if anim_name == 'true':
		$buttonKecap.disabled = true
		itemFound+=1
		$"hint/BoardLong/soy sauce".visible = false
		


func _on_garpuAni_animation_finished(anim_name):
	if anim_name == 'true':
		itemFound+=1
		$buttonGarpu.disabled = true
		$hint/BoardLong/fork.visible = false


func _on_sugarAni_animation_finished(anim_name):
	if anim_name == 'true':
		itemFound+=1
		$buttonSugar.disabled = true
		$hint/BoardLong/sugar.visible = false


func _on_sendokAni_animation_finished(anim_name):
	if anim_name == 'true':
		itemFound+=1
		$buttonSendok.disabled = true
		$hint/BoardLong/spoon.visible = false


func _on_piringAni_animation_finished(anim_name):
	if anim_name == 'true':
		$buttonPiring.disabled = true
		itemFound+=1
		$hint/BoardLong/plate.visible = false
		


func _on_caosAni_animation_finished(anim_name):
	if anim_name == 'true':
		$buttonCaos.disabled = true
		itemFound+=1
		$"hint/BoardLong/kechup sauce".visible = false
		


func _on_buttonKnife_pressed():
	$buttonKnife/Pisau.z_index = 10
	knifeAni.play("true")


func _on_pisauAni_animation_finished(anim_name):
	if anim_name == 'true':
		$buttonKnife.disabled = true
		itemFound+=1
		$'hint/BoardLong/knife'.visible = false


func _on_gameTimer_timeout():
	score = 0
