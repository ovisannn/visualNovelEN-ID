extends Node2D

onready var showHint = $"hint/AnimationPlayer"
onready var caos = $buttonCaos/caosAni
onready var piring = $buttonPiring/piringAni
onready var sendok = $buttonSendok/sendokAni
onready var gula = $buttonSugar/sugarAni
onready var kecap = $buttonKecap/kecapAni
onready var garpu = $buttonGarpu/garpuAni
var itemFound = 0


func pressed():
	print('button pressed')

func _ready():
	pass
func _process(_delta):
	if itemFound == 6 :
		get_tree().change_scene("res://scene/eps2/2.tscn")


func _on_buttonKecap_pressed():
	kecap.play("true")


func _on_buttonGarpu_pressed():
	garpu.play("true")


func _on_buttonSugar_pressed():
	gula.play("true")


func _on_buttonSendok_pressed():
	sendok.play("true")


func _on_buttonPiring_pressed():
	piring.play("true")


func _on_buttonCaos_pressed():
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
		
