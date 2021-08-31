extends Control

export(String) var label = "Default"
export(String) var placeholder_text = ""
export(String) var value = ""

func _ready():
	$Container/label.text = str(label)+":"
	$Container/info.placeholder_text = str(placeholder_text)
	$Container/info.text = str(value)
	
	if BackRun.dark == true:
		get_node("Container/info").add_color_override("font_color", Color(1,1,1,1))
	pass


func _on_info_text_changed(new_text):
	value = new_text
	pass


func _on_Drop_item_selected(index):
	value = $Container/drop.text
	pass
