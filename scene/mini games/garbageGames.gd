extends Node2D

onready var mainTimer = $mainGameTimer


func _ready():
	mainTimer.start()

func _process(delta):
	#print(mainTimer.get_time_left())
	if $garbages.get_child_count() == 0:
		get_tree().change_scene("res://scene/eps4/3.tscn")


func _on_mainGameTimer_timeout():
	#print('timeout')
	mainTimer.stop()
