extends Control

export(String) var label = "Default"
export(String) var stats = 0
export(String) var date = "Default"

func _ready():
	$label.text = "  "+str(label)+" "
	$stats._select_int(0)
	if BackRun.dark == true:
		get_node("label").add_color_override("font_color", Color(1,1,1,1))
	pass

func _on_remove_pressed():
	get_parent().get_parent().remove_data($Container/label.text)
	queue_free()
	pass

func update_ui(num):
	$stats._select_int(num)
	pass


func _on_OptionButton_item_selected(index):
	stats=$stats.text
	get_parent().get_parent().save_data()
