extends Control

export(String) var label = "Default"

func _ready():
	$LineEdit.text = str(label)
	if BackRun.dark == true:
		get_node("LineEdit").add_color_override("font_color", Color(1,1,1,1))
	pass
