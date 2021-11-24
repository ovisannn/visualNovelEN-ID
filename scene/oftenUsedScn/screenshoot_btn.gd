extends CanvasLayer

const SAVE_IMAGE_FILENAME = 'godot-win-image-cache.png'
const SAVED_IMAGE_PATH = 'user://' + SAVE_IMAGE_FILENAME

var SCREENSHOT_ABSOLUTE_PATH = OS.get_data_dir() + SAVE_IMAGE_FILENAME

func pressed():
	get_viewport().queue_screen_capture()
	yield(get_tree(), 'idle_frame')
	yield(get_tree(), 'idle_frame')

	# get screen capture
	get_viewport().get_screen_capture().save_png(SAVED_IMAGE_PATH)

func _on_TextureButton_pressed():
	pressed()
