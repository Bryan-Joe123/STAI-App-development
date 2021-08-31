extends Control

export(String) var label = "Default"
export(String) var des = "Default"

func _ready():
	$Container/label.text = "  "+str(label)+" "
	$Container/Add/Disc.text = str(des)
	if BackRun.dark == true:
		get_node("Container/Add/Disc").add_color_override("font_color", Color(1,1,1,1))
	pass

func _process(delta):
	if $Container/Add/Disc.text != des:
		des=$Container/Add/Disc.text
		get_parent().get_parent().save_data()

func _on_remove_pressed():
	get_parent().get_parent().remove_data($Container/label.text)
	queue_free()
	pass
