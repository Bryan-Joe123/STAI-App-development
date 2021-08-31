extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$CheckButton.pressed = BackRun.dark
	BackRun.update_fontsize($SpinBox.value)
	pass


func _on_AboutMe_pressed():
	print(get_tree().change_scene("res://Screens/AboutMe.tscn"))
	pass

func _on_Logout_pressed():
	$Dark.visible=true
	$GetName.popup()
	pass


func _on_Cancel_pressed():
	$Dark.visible=false
	$GetName.visible=false
	pass # Replace with function body.


func _on_Done_pressed():
	get_tree().change_scene("res://Screens/Login.tscn")
	pass # Replace with function body.


func _on_CheckButton_toggled(button_pressed):
	if button_pressed == true:
		BackRun.set_dark()
	else:
		BackRun.set_bright()
	pass


func _on_SpinBox_value_changed(value):
	BackRun.update_fontsize(value)
	pass
