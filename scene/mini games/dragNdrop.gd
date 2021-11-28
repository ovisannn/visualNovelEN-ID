extends KinematicBody2D

var dragging = false
var currentPos
signal dragsignal
export(int) var garbageType
export(Resource) var spriteType
var rightPlace = false
var wrongPlace = false

signal wrong

#1.anor
#2.or

func _ready():
	currentPos = get_position()
	connect("dragsignal",self,"_set_drag_pc")
	$Sprite.texture = spriteType
	
	
func _process(delta):
	if dragging:
		var mousepos = get_viewport().get_mouse_position()
		self.position = Vector2(mousepos.x, mousepos.y)
		self.z_index = 10
	if not dragging:
		self.z_index = 3		
		self.position = Vector2(currentPos)
	if not dragging and rightPlace == true:
		queue_free()
	if not dragging and wrongPlace == true:
		wrongPlace = false
		emit_signal("wrong")


func _set_drag_pc():
	dragging=!dragging


func _on_KinematicBody2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			emit_signal("dragsignal")
		elif event.button_index == BUTTON_LEFT and !event.pressed:
			emit_signal("dragsignal")
	elif event is InputEventScreenTouch:
		if event.pressed and event.get_index() == 0:
			self.position = event.get_position()
		


func _on_garbageObject_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			emit_signal("dragsignal")
		elif event.button_index == BUTTON_LEFT and !event.pressed:
			emit_signal("dragsignal")
	elif event is InputEventScreenTouch:
		if event.pressed and event.get_index() == 0:
			self.position = event.get_position()


func _on_detector_area_entered(area):
	if garbageType == 2 and area.name == 'organicPlace':
		rightPlace = true
		#queue_free()
	if garbageType == 1 and area.name == 'anorganicPlace':
		rightPlace = true		
		#queue_free()
		
	if garbageType == 2 and area.name == 'anorganicPlace':
		wrongPlace = true
	if garbageType == 1 and area.name == 'organicPlace':
		wrongPlace = true	


func _on_detector_area_exited(area):
	if garbageType == 2 and area.name == 'organicPlace':
		rightPlace = false
		#queue_free()
	if garbageType == 1 and area.name == 'anorganicPlace':
		rightPlace = false		
		#queue_free()
	if garbageType == 2 and area.name == 'anorganicPlace':
		wrongPlace = false
	if garbageType == 1 and area.name == 'organicPlace':
		wrongPlace = false
