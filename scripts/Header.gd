extends Control

export(String) var head = "Default"

func _ready():
	$Border/Head.text = head
	pass


func _on_Back_pressed():
	print(get_tree().change_scene("res://Screens/MainScene.tscn"))
	pass
