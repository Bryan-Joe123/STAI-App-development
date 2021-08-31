extends Control

var save_file = "user://Login.save"
var current_file = "user://Current.save"
var details = []

func _ready():
	load_data()
	print(details)
	pass

func load_data():
	var f = File.new()
	if f.file_exists(save_file):
		f.open(save_file, File.READ)
		details = f.get_var()
		f.close()
	else:
		start()

func logIn():
	if check($UserName.text):
		for x in details:
			if x.user_name == $UserName.text and x.password == $Password.text:
				set_currentUser(x.user_name)
				print(get_tree().change_scene("res://Screens/MainScene.tscn"))
			else:
				if details[-1] == x:
					$AnimationPlayer.play("NoUser")
				
	else:
		$AnimationPlayer.play("NoUser")
		pass
	pass

func signIn(userName,password,fname):
	set_currentUser(userName)
	print(details)
	details.append({"user_name":userName,"password":password,"name":fname})
	var f = File.new()
	f.open(save_file, File.WRITE)
	f.store_var(details)
	f.close()

func start():
	var f = File.new()
	var fdetails = []
	f.open(save_file, File.WRITE)
	f.store_var(fdetails)
	f.close()
	logIn()

func check(user):
	for x in details:
		if x.user_name == user:
			return(true)
	pass

func set_currentUser(user):
	var f = File.new()
	f.open(current_file, File.WRITE)
	f.store_var(user)
	f.close()
	pass

func _on_Login_pressed():
	logIn()
	pass


func _on_SignIn_pressed():
	$GetName.popup()
	$Dark.visible=true
	pass


func _on_Cancel_pressed():
	$GetName.visible=false
	$Dark.visible=false
	pass

func _on_Done_pressed():
	signIn(str($GetName/User.text),$GetName/Password.text,$GetName/Name.text)
	print(get_tree().change_scene("res://Screens/MainScene.tscn"))
	pass
