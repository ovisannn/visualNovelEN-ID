extends LineEdit

var screen_height = ProjectSettings.get_setting("display/window/size/height")
var actual_resolution = OS.get_window_size()
var set_position = true
var global_position
var target_y
var target_x

func reposition():

	if has_focus():
		target_x = 585
		target_y = 129
		#var ratio = screen_height / actual_resolution.y
		#target_y = min(global_position.y, screen_height - get_size().y - (OS.get_virtual_keyboard_height() * ratio))
	else:
		target_y = global_position.y
		target_x = global_position.x

	set_global_position(Vector2(target_x, target_y))

func _process(delta):
	if set_position:
		global_position = get_global_position()
		set_position = false
	reposition()
#140, 151
func _on_Entri_focus_entered():
	print(target_y)
	$TextureButton.visible = true


func _on_Entri_focus_exited():
	$TextureButton.visible = false


func _on_broccoliEntri_focus_entered():
	#print(target_y)
	$TextureButton.visible = true


func _on_carrotEntri_focus_entered():
	$TextureButton.visible = true


func _on_cabbageEntri_focus_entered():
	$TextureButton.visible = true


func _on_cabbageEntri_focus_exited():
	$TextureButton.visible = false


func _on_lemonEntri_focus_exited():
	$TextureButton.visible = false


func _on_broccoliEntri_focus_exited():
	$TextureButton.visible = false


func _on_carrotEntri_focus_exited():
	$TextureButton.visible = false


func _on_lemonEntri_focus_entered():
	$TextureButton.visible = true # Replace with function body.


func _on_LineEdit_focus_entered():
	$TextureButton.visible = true


func _on_LineEdit_focus_exited():
	$TextureButton.visible = false
