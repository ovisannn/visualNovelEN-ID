extends Node2D

onready var mainTimer = $mainGameTimer
onready var score = 100

func scoreMinus():
	score-=20
	print(score)

func _ready():
	mainTimer.start()

func _process(_delta):
	#print(mainTimer.get_time_left())
	if $garbages.get_child_count() == 0:
		get_tree().change_scene("res://scene/eps4/3.tscn")


func _on_mainGameTimer_timeout():
	#print('timeout')
	mainTimer.stop()


func _on_garbageObject_wrong():
	scoreMinus()


func _on_garbageObject2_wrong():
	scoreMinus()


func _on_garbageObject3_wrong():
	scoreMinus()


func _on_garbageObject4_wrong():
	scoreMinus()


func _on_garbageObject5_wrong():
	scoreMinus()


func _on_garbageObject6_wrong():
	scoreMinus()


func _on_garbageObject7_wrong():
	scoreMinus()


func _on_garbageObject8_wrong():
	scoreMinus()


func _on_garbageObject10_wrong():
	scoreMinus()


func _on_garbageObject11_wrong():
	scoreMinus()


func _on_garbageObject12_wrong():
	scoreMinus()
