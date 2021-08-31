extends Control

var item = preload("res://Assets/TSCN/PersonalDetailsItem.tscn")

var save_file = "user://personal.save"
var current_file = "user://Current.save"

var details = []

func _ready():
	get_user()
	load_data()
	loadInputs()
	pass

func loadInputs():
	for x in $Scroll/Container.get_children():
		x.queue_free()
	for x in details:
		var itemins = item.instance()
		itemins.label = x.name
		if not x.has("placeholder_text"):
			if x.has("drop"):
				itemins.get_node("Container/drop").visible=true
				for y in x.drop:
					itemins.get_node("Container/drop").add_item(y)
			else:
				itemins.get_node("Container/info").visible=true
				itemins.placeholder_text = x.name
		else:
			itemins.get_node("Container/info").visible=true
			itemins.placeholder_text = x.placeholder_text
		itemins.value = x.value
		$Scroll/Container.add_child(itemins)
		pass
	var itemins = item.instance()
	itemins.label = "Extra"
	$Scroll/Container.add_child(itemins)
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
	details = []
	for x in $Scroll/Container.get_children():
		if not x.get_node("Container/drop").visible==true:
			details.append({"name":x.label,"value":x.value})
		else:
			details.append({"name":x.label,"value":x.value,"drop":["Male","Female"]})
		pass
	var f = File.new()
	f.open(save_file, File.WRITE)
	f.store_var(details)
	f.close()

func create_data():
	var f = File.new()
	var fdetails = [
		{"name":"Name","value":""},
		{"name":"Class","value":""},
		{"name":"GRNO","value":""},
		{"name":"School","value":""},
		{"name":"Contact","value":""},
		{"name":"DOB","value":"","placeholder_text":"dd/mm/yyyy"},
		{"name":"Father's Name","value":""},
		{"name":"Mothers's Name","value":""},
		{"name":"Address","value":""},
		{"name":"Gender","value":"","drop":["Male","Female"]}
	]
	f.open(save_file, File.WRITE)
	f.store_var(fdetails)
	f.close()
	load_data()

func add_data(name):
	details.append({"name":name,"value":""})
	var f = File.new()
	f.open(save_file, File.WRITE)
	f.store_var(details)
	f.close()
	pass

func _on_Save_pressed():
	save_data()
	pass

func get_user():
	var f = File.new()
	if f.file_exists(current_file):
		f.open(current_file, File.READ)
		save_file = "user://"+f.get_var()+"personal.save"
		f.close()
	
	pass

func _on_Add_pressed():
	$GetName.popup()
	$Dark.visible=true
	pass


func _on_Done_pressed():
	add_data($GetName/LineEdit.text)
	$GetName/LineEdit.text = ""
	$GetName.visible=false
	$Dark.visible=false
	loadInputs()
	pass


func _on_Cancel_pressed():
	$GetName.visible=false
	$Dark.visible=false
	pass
