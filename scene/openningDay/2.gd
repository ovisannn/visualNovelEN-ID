extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect/AnimationPlayer.play("fade in")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == 'fade in':
		$ColorRect/AnimationPlayer.play("fade out")
	if anim_name == 'fade out':
		get_tree().change_scene("res://scene/eps2/1.tscn")
