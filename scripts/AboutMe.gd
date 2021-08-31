extends Control

var save_file = "user://aboutme.save"
var current_file = "user://Current.save"
var details = []


func _ready():
	get_user()
	load_data()
	loadInputs()
	if BackRun.dark == true:
		get_node("TextEdit").add_color_override("font_color", Color(1,1,1,1))
	pass

func loadInputs():
	$TextEdit.text = details
	pass

func load_data():
	var f = File.new()
	if f.file_exists(save_file):
		f.open(save_file, File.READ)
		details = f.get_var()
		f.close()
	else:
		create_data()

func save_data():
	details = $TextEdit.text
	var f = File.new()
	f.open(save_file, File.WRITE)
	f.store_var(details)
	f.close()

func create_data():
	var f = File.new()
	var fdetails = """Hello!
I would like to share about myself
'Click and Add Text'"""
	f.open(save_file, File.WRITE)
	f.store_var(fdetails)
	f.close()
	load_data()

func get_user():
	var f = File.new()
	if f.file_exists(current_file):
		f.open(current_file, File.READ)
		save_file = "user://"+f.get_var()+"aboutme.save"
		f.close()

func _on_Save_pressed():
	save_data()
	pass
