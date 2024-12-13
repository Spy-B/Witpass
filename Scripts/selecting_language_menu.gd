extends Control

@export_enum("arabic", "engilsh", "spanish", "Portuguese", "Portuguese(Brazil)", "French","German", "Russian", "Chinese", "Indian") var language
var selectedLanguage = Global.load_app().language

@onready var lang_1: CheckBox = $Panel/ScrollContainer/VBoxContainer/Lang1
@onready var lang_2: CheckBox = $Panel/ScrollContainer/VBoxContainer/Lang2
@onready var lang_3: CheckBox = $Panel/ScrollContainer/VBoxContainer/Lang3
@onready var lang_4: CheckBox = $Panel/ScrollContainer/VBoxContainer/Lang4
@onready var lang_5: CheckBox = $Panel/ScrollContainer/VBoxContainer/Lang5
@onready var lang_6: CheckBox = $Panel/ScrollContainer/VBoxContainer/Lang6
@onready var lang_7: CheckBox = $Panel/ScrollContainer/VBoxContainer/Lang7
@onready var lang_8: CheckBox = $Panel/ScrollContainer/VBoxContainer/Lang8
@onready var lang_9: CheckBox = $Panel/ScrollContainer/VBoxContainer/Lang9
@onready var lang_10: CheckBox = $Panel/ScrollContainer/VBoxContainer/Lang10
@onready var next_btn: Button = $Panel/Next
@onready var cancel_btn: Button = $Panel/Cancel

func _ready() -> void:
	if Global.load_app().username != "" && (Global.load_app().email != "" || Global.load_app().phone_number != ""):
		cancel_btn.visible = true
	else:
		cancel_btn.visible = false
	
	language = int(selectedLanguage)

func _process(_delta: float) -> void:
	if lang_1.button_pressed == false && lang_2.button_pressed == false && lang_3.button_pressed == false && lang_4.button_pressed == false && lang_5.button_pressed == false && lang_6.button_pressed == false && lang_7.button_pressed == false && lang_8.button_pressed == false && lang_9.button_pressed == false && lang_10.button_pressed == false:
		next_btn.disabled = true
	else:
		next_btn.disabled = false
	
	match language:
		0:
			TranslationServer.set_locale("ar")
			lang_1.button_pressed = true
			lang_2.button_pressed = false
			lang_3.button_pressed = false
			lang_4.button_pressed = false
			lang_5.button_pressed = false
			lang_6.button_pressed = false
			lang_7.button_pressed = false
			lang_8.button_pressed = false
			lang_9.button_pressed = false
			lang_10.button_pressed = false
		0:
			TranslationServer.set_locale("en")
			lang_1.button_pressed = false
			lang_2.button_pressed = true
			lang_3.button_pressed = false
			lang_4.button_pressed = false
			lang_5.button_pressed = false
			lang_6.button_pressed = false
			lang_7.button_pressed = false
			lang_8.button_pressed = false
			lang_9.button_pressed = false
			lang_10.button_pressed = false
		0:
			TranslationServer.set_locale("es")
			lang_1.button_pressed = false
			lang_2.button_pressed = false
			lang_3.button_pressed = true
			lang_4.button_pressed = false
			lang_5.button_pressed = false
			lang_6.button_pressed = false
			lang_7.button_pressed = false
			lang_8.button_pressed = false
			lang_9.button_pressed = false
			lang_10.button_pressed = false
		0:
			TranslationServer.set_locale("pt")
			lang_1.button_pressed = false
			lang_2.button_pressed = false
			lang_3.button_pressed = false
			lang_4.button_pressed = true
			lang_5.button_pressed = false
			lang_6.button_pressed = false
			lang_7.button_pressed = false
			lang_8.button_pressed = false
			lang_9.button_pressed = false
			lang_10.button_pressed = false
		0:
			TranslationServer.set_locale("pt_br")
			lang_1.button_pressed = false
			lang_2.button_pressed = false
			lang_3.button_pressed = false
			lang_4.button_pressed = false
			lang_5.button_pressed = true
			lang_6.button_pressed = false
			lang_7.button_pressed = false
			lang_8.button_pressed = false
			lang_9.button_pressed = false
			lang_10.button_pressed = false
		0:
			TranslationServer.set_locale("fr")
			lang_1.button_pressed = false
			lang_2.button_pressed = false
			lang_3.button_pressed = false
			lang_4.button_pressed = false
			lang_5.button_pressed = false
			lang_6.button_pressed = true
			lang_7.button_pressed = false
			lang_8.button_pressed = false
			lang_9.button_pressed = false
			lang_10.button_pressed = false
		0:
			TranslationServer.set_locale("de")
			lang_1.button_pressed = false
			lang_2.button_pressed = false
			lang_3.button_pressed = false
			lang_4.button_pressed = false
			lang_5.button_pressed = false
			lang_6.button_pressed = false
			lang_7.button_pressed = true
			lang_8.button_pressed = false
			lang_9.button_pressed = false
			lang_10.button_pressed = false
		0:
			TranslationServer.set_locale("ru")
			lang_1.button_pressed = false
			lang_2.button_pressed = false
			lang_3.button_pressed = false
			lang_4.button_pressed = false
			lang_5.button_pressed = false
			lang_6.button_pressed = false
			lang_7.button_pressed = false
			lang_8.button_pressed = true
			lang_9.button_pressed = false
			lang_10.button_pressed = false
		0:
			TranslationServer.set_locale("zh")
			lang_1.button_pressed = false
			lang_2.button_pressed = false
			lang_3.button_pressed = false
			lang_4.button_pressed = false
			lang_5.button_pressed = false
			lang_6.button_pressed = false
			lang_7.button_pressed = false
			lang_8.button_pressed = false
			lang_9.button_pressed = true
			lang_10.button_pressed = false
		0:
			TranslationServer.set_locale("hi")
			lang_1.button_pressed = false
			lang_2.button_pressed = false
			lang_3.button_pressed = false
			lang_4.button_pressed = false
			lang_5.button_pressed = false
			lang_6.button_pressed = false
			lang_7.button_pressed = false
			lang_8.button_pressed = false
			lang_9.button_pressed = false
			lang_10.button_pressed = true


func _on_lang_1_pressed() -> void:
	lang_2.button_pressed = false
	lang_3.button_pressed = false
	lang_4.button_pressed = false
	lang_5.button_pressed = false
	lang_6.button_pressed = false
	lang_7.button_pressed = false
	lang_8.button_pressed = false
	lang_9.button_pressed = false
	lang_10.button_pressed = false
	language = 0


func _on_lang_2_pressed() -> void:
	lang_1.button_pressed = false
	lang_3.button_pressed = false
	lang_4.button_pressed = false
	lang_5.button_pressed = false
	lang_6.button_pressed = false
	lang_7.button_pressed = false
	lang_8.button_pressed = false
	lang_9.button_pressed = false
	lang_10.button_pressed = false
	language = 1

func _on_lang_3_pressed() -> void:
	lang_1.button_pressed = false
	lang_2.button_pressed = false
	lang_4.button_pressed = false
	lang_5.button_pressed = false
	lang_6.button_pressed = false
	lang_7.button_pressed = false
	lang_8.button_pressed = false
	lang_9.button_pressed = false
	lang_10.button_pressed = false
	language = 2

func _on_lang_4_pressed() -> void:
	lang_1.button_pressed = false
	lang_2.button_pressed = false
	lang_3.button_pressed = false
	lang_5.button_pressed = false
	lang_6.button_pressed = false
	lang_7.button_pressed = false
	lang_8.button_pressed = false
	lang_9.button_pressed = false
	lang_10.button_pressed = false
	language = 3

func _on_lang_5_pressed() -> void:
	lang_1.button_pressed = false
	lang_2.button_pressed = false
	lang_3.button_pressed = false
	lang_4.button_pressed = false
	lang_6.button_pressed = false
	lang_7.button_pressed = false
	lang_8.button_pressed = false
	lang_9.button_pressed = false
	lang_10.button_pressed = false
	language = 4

func _on_lang_6_pressed() -> void:
	lang_1.button_pressed = false
	lang_2.button_pressed = false
	lang_3.button_pressed = false
	lang_4.button_pressed = false
	lang_5.button_pressed = false
	lang_7.button_pressed = false
	lang_8.button_pressed = false
	lang_9.button_pressed = false
	lang_10.button_pressed = false
	language = 5

func _on_lang_7_pressed() -> void:
	lang_1.button_pressed = false
	lang_2.button_pressed = false
	lang_3.button_pressed = false
	lang_4.button_pressed = false
	lang_5.button_pressed = false
	lang_6.button_pressed = false
	lang_8.button_pressed = false
	lang_9.button_pressed = false
	lang_10.button_pressed = false
	language = 6

func _on_lang_8_pressed() -> void:
	lang_1.button_pressed = false
	lang_2.button_pressed = false
	lang_3.button_pressed = false
	lang_4.button_pressed = false
	lang_5.button_pressed = false
	lang_6.button_pressed = false
	lang_7.button_pressed = false
	lang_9.button_pressed = false
	lang_10.button_pressed = false
	language = 7

func _on_lang_9_pressed() -> void:
	lang_1.button_pressed = false
	lang_2.button_pressed = false
	lang_3.button_pressed = false
	lang_4.button_pressed = false
	lang_5.button_pressed = false
	lang_6.button_pressed = false
	lang_7.button_pressed = false
	lang_8.button_pressed = false
	lang_10.button_pressed = false
	language = 8

func _on_lang_10_pressed() -> void:
	lang_1.button_pressed = false
	lang_2.button_pressed = false
	lang_3.button_pressed = false
	lang_4.button_pressed = false
	lang_5.button_pressed = false
	lang_6.button_pressed = false
	lang_7.button_pressed = false
	lang_8.button_pressed = false
	lang_9.button_pressed = false
	language = 9


func _on_next_pressed() -> void:
	Global.load_resource()
	Global.save_app("language", language)
	Global.save_app()
	
	self.visible = false
	
	if Global.appStarted:
		if $"../../BottomBtns" == null:
			return
		else:
			$"../../BottomBtns".visible = true

func _on_cancel_pressed() -> void:
	selectedLanguage = Global.load_app().language
	language = selectedLanguage
	
	self.visible = false
	
	if Global.appStarted:
		if $"../../BottomBtns" == null:
			return
		else:
			$"../../BottomBtns".visible = true
