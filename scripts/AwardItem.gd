extends Control

export(String) var label = "Default"
export(String) var des = "Default"
export(String) var date = "Default"

func _ready():
	$container/label.text = "  "+str(label)+" "
	$container/Disc.text = "  "+str(des)+" "
	$container/date.text = "  "+str(date)+"   "
	if BackRun.dark == true:
		get_node("container/Disc").add_color_override("font_color", Color(1,1,1,1))
	pass

func _process(delta):
	if $container/Disc.text != des:
		des=$container/Disc.text
		get_parent().get_parent().save_data()

func _on_remove_pressed():
	get_parent().get_parent().remove_data($container/label.text)
	queue_free()
	pass
