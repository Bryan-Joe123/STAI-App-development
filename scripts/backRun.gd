extends Node

var dark = false
var def_fontsize = 50 
var back = preload("res://Assets/Back.tres")
var button = preload("res://Assets/ButtonTheme.tres")
var theme_var = preload("res://theme.tres")
var font = preload("res://Font/SecularOne-Regular.ttf")

func _ready():
	update_fontsize(def_fontsize)
	pass

func update_fontsize(size):
	theme_var.default_font.set_size(size)
	pass

func set_dark():
	dark = true
	back.set_bg_color("#2F2F2F")
	back.set_border_color("#171717")
	button.set_bg_color("#333333")
	theme_var.set_color("custom_colors/font_color","TextEdit","#ffffff")

func set_bright():
	dark = false
	back.set_bg_color("#f5f7fa")
	back.set_border_color("#e4e6ea")
	button.set_bg_color("#ffffff")
	theme_var.set_color("custom_colors/font_color","TextEdit","#000000")
