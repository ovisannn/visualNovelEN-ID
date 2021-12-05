extends Node2D


onready var gameLoad = $loadGameStat
onready var eps1	= $eps1
onready var eps2	= $eps2
onready var eps3	= $eps3
onready var eps4	= $eps4
var showTranslate = false

func stopBGM():
	var bgm = get_node("/root/MainMenuBgm")

func _ready():
	var person = gameLoad.resLoadGame()
	gameLoad.loadGameProperty(person)
	var progressEps = person.latestEpisode
	if progressEps >= 1:
		eps1.disabled = false
	if progressEps >= 2:
		eps2.disabled = false
	if progressEps >= 3:
		eps3.disabled = false
	if progressEps >= 4:
		eps4.disabled = false
	



func _on_eps1_pressed():
	stopBGM()	
	get_tree().change_scene("res://scene/tutorial/mainTutorial.tscn")


func _on_eps2_pressed():
	stopBGM()	
	get_tree().change_scene("res://scene/openningDay/2.tscn")


func _on_eps3_pressed():
	stopBGM()	
	get_tree().change_scene("res://scene/openningDay/3.tscn")


func _on_eps4_pressed():
	stopBGM()	
	get_tree().change_scene("res://scene/openningDay/4.tscn")
