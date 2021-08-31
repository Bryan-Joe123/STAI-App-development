extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_TimeTable_pressed():
	print(get_tree().change_scene("res://Screens/TimeTable.tscn"))
	pass


func _on_Task_pressed():
	print(get_tree().change_scene("res://Screens/Task.tscn"))
	pass


func _on_PersonalDetails_pressed():
	print(get_tree().change_scene("res://Screens/PersonalDetails.tscn"))
	pass





func _on_Skills_pressed():
	print(get_tree().change_scene("res://Screens/Skills.tscn"))
	pass


func _on_Awards_pressed():
	print(get_tree().change_scene("res://Screens/Awards.tscn"))
	pass




func _on_Settings_pressed():
	print(get_tree().change_scene("res://Screens/Settings.tscn"))
	pass
