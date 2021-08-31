extends Control

var item = preload("res://Assets/TSCN/SkillsItem.tscn")

var save_file = "user://skill.save"
var current_file = "user://Current.save"

var details = []

func _ready():
	get_user()
	load_data()
	loadInputs()
	pass

func loadInputs():
	for x in $Container.get_children():
		x.queue_free()
	for x in details:
		var itemins = item.instance()
		itemins.label = x.name
		itemins.des = x.des
		$Container.add_child(itemins)
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
	details = []
	for x in $Container.get_children():
		details.append({"name":x.label,"des":x.des})
		pass
	var f = File.new()
	f.open(save_file, File.WRITE)
	f.store_var(details)
	f.close()

func get_user():
	var f = File.new()
	if f.file_exists(current_file):
		f.open(current_file, File.READ)
		save_file = "user://"+f.get_var()+"skill.save"
		f.close()

func create_data():
	var f = File.new()
	var fdetails = []
	f.open(save_file, File.WRITE)
	f.store_var(fdetails)
	f.close()
	load_data()

func add_data(name,des):
	details.append({"name":name,"des":des})
	var f = File.new()
	f.open(save_file, File.WRITE)
	f.store_var(details)
	f.close()
	loadInputs()
	pass

func _on_Add_pressed():
	save_data()
	$GetName.popup()
	$Dark.visible=true
	pass

func _on_Cancel_pressed():
	$GetName.visible=false
	$Dark.visible=false
	pass

func _on_Done_pressed():
	save_data()
	if $GetName/Skills.text != "":
		add_data(str($GetName/Skills.text),str($GetName/Description.text))
		$GetName/Skills.text=""
		$GetName/Description.text=""
	$GetName.visible=false
	$Dark.visible=false
	pass
