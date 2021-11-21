extends KinematicBody2D

var speed = 150
var velocity = Vector2()
var garbageType
var spriteType

onready var anorganic = {
	'botol':preload ("res://asset/minigames3/botol.png"),
	'kaleng' :preload ("res://asset/minigames3/kaleng 3.png"),
	'kardus':preload ("res://asset/minigames3/kardus.png")
}

onready var organic = {
	'gedang' :preload ("res://asset/minigames3/gedang.png")
}


func spriteSelector_anorganic():
	var random2 = RandomNumberGenerator.new()
	random2.randomize()
	var spriteSelect = random2.randi_range(1,3)
	if spriteSelect == 1:
		$Sprite.texture = anorganic['kaleng']
	elif spriteSelect == 2:
		$Sprite.texture = anorganic['botol']
	elif spriteSelect == 3:
		$Sprite.texture = anorganic['kardus']

func _ready():
	var random = RandomNumberGenerator.new()
	random.randomize()
	garbageType = random.randi_range(1,2)
	#1--anorganic
	#2--organic
	if garbageType == 1:
		spriteSelector_anorganic()
	elif garbageType == 2:
		$Sprite.texture = organic['gedang']
	

func _process(delta):
	pass


#=====================================================
		



