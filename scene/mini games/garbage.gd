extends Node2D

var speed = 100
var velocity = Vector2()
var pressed = false

func movement():
	velocity = Vector2()
	
	if not pressed:
		velocity.x += 1
	
	velocity = velocity.normalized()*speed


func _process(delta):
	movement()
	velocity = move_and_slide()
