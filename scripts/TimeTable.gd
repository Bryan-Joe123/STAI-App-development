extends Control

var item = preload("res://Assets/TSCN/TimeTableItem.tscn")
var itemDark = preload("res://Assets/TSCN/TimeTableItemDark.tscn")

var save_file = "user://timetable.save"
var current_file = "user://Current.save"
var details = []

var timeDict = OS.get_time();
var hour = timeDict.hour;

func _ready():
	get_user()
	add_dropdown()
	load_data()
	loadInputs()
	if hour>19:
		if Engine.has_singleton("LocalNotification"):
			Engine.get_singleton("LocalNotification").showLocalNotification("Test","TestBody",2,1)
			pass
	pass

func loadInputs():
	for x in $Container.get_children():
		x.queue_free()
	$Container.columns = details[0].size()
	for x in details:
		for y in x:
			var itemins
			if y in ["","Sun","Mon","Tue","Wed","Thu","Break"] or int(y) and not(y in ["2 Lang","3 Lang"]):
				itemins = itemDark.instance()
				itemins.label = y
			else:
				itemins = item.instance()
				itemins.label = y
			$Container.add_child(itemins)
			pass
		pass
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
	var f = File.new()
	f.open(save_file, File.WRITE)
	f.store_var(details)
	f.close()

func create_data():
	var f = File.new()
	var fdetails = [
		[""],
		["Sun"],
		["Mon"],
		["Tue"],
		["Wed"],
		["Thu"]
	]
	f.open(save_file, File.WRITE)
	f.store_var(fdetails)
	f.close()
	load_data()

func add_data(name):
	for x in details.size():
		details[x].append(name[x])
	var f = File.new()
	f.open(save_file, File.WRITE)
	f.store_var(details)
	f.close()
	save_data()
	loadInputs()
	pass

func _on_Save_pressed():
	save_data()
	pass


func _on_Add_pressed():
	$GetName.popup()
	$Dark.visible=true
	pass

func get_user():
	var f = File.new()
	if f.file_exists(current_file):
		f.open(current_file, File.READ)
		save_file = "user://"+f.get_var()+"timetable.save"
		f.close()

func _on_Done_pressed():
	add_data(
		[
			str(details[0].size()),
			$GetName/VBoxContainer/Sun/OptionButton.text,
			$GetName/VBoxContainer/Mon/OptionButton.text,
			$GetName/VBoxContainer/Tue/OptionButton.text,
			$GetName/VBoxContainer/Wed/OptionButton.text,
			$GetName/VBoxContainer/Thu/OptionButton.text
		]
	)
	$GetName.visible=false
	$Dark.visible=false
	loadInputs()
	pass


func _on_Cancel_pressed():
	$GetName.visible=false
	$Dark.visible=false
	pass

func add_dropdown():
	for x in ["Sun","Mon","Tue","Wed","Thu"]:
		get_node("GetName/VBoxContainer/"+x+"/OptionButton").add_item("Math")
		get_node("GetName/VBoxContainer/"+x+"/OptionButton").add_item("Sci")
		get_node("GetName/VBoxContainer/"+x+"/OptionButton").add_item("Soc")
		get_node("GetName/VBoxContainer/"+x+"/OptionButton").add_item("Eng")
		get_node("GetName/VBoxContainer/"+x+"/OptionButton").add_item("2 Lang")
		get_node("GetName/VBoxContainer/"+x+"/OptionButton").add_item("3 Lang")
		get_node("GetName/VBoxContainer/"+x+"/OptionButton").add_item("Chem")
		get_node("GetName/VBoxContainer/"+x+"/OptionButton").add_item("Phy")
		get_node("GetName/VBoxContainer/"+x+"/OptionButton").add_item("Bio")
		get_node("GetName/VBoxContainer/"+x+"/OptionButton").add_item("Geo")
		get_node("GetName/VBoxContainer/"+x+"/OptionButton").add_item("Hist")
		get_node("GetName/VBoxContainer/"+x+"/OptionButton").add_item("Pol")
		get_node("GetName/VBoxContainer/"+x+"/OptionButton").add_item("Break")
		get_node("GetName/VBoxContainer/"+x+"/OptionButton").add_item("Mus")
		get_node("GetName/VBoxContainer/"+x+"/OptionButton").add_item("Dan")
		get_node("GetName/VBoxContainer/"+x+"/OptionButton").add_item("Com")
		get_node("GetName/VBoxContainer/"+x+"/OptionButton").add_item("Art")
		get_node("GetName/VBoxContainer/"+x+"/OptionButton").add_item("PE")
		get_node("GetName/VBoxContainer/"+x+"/OptionButton").add_item("Extra")
