extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("loaded")
	var dialog = Dialogic.start("test")
	var a = Dialogic.get_variable("isMale")
	print(a)
	Dialogic.set_variable("isMale", 1)
	print(Dialogic.get_variable("isMale"))
	add_child(dialog)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#print(dialog.isMale)
