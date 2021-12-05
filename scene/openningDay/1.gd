extends Node2D

func _ready():
	$ColorRect/AnimationPlayer.play("fade in")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == 'fade in':
		$ColorRect/AnimationPlayer.play("fade out")
	if anim_name == 'fade out':
		get_tree().change_scene("res://scene/eps1/1.tscn")
